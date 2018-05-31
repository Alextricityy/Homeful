class ContributionsController < ApplicationController
  # before_action :set_contribution, except: [:new, :index, :create]
  before_action :set_item, except: [:show]

  # def new
  #   @recipient = Recipient.find(params[:recipient_id])
  #   @contribution = Contribution.new
  # end

  def create
    @contribution = Contribution.new(contribution_params)
    @contribution.state = "pending"
    @contribution.amount_cents = @contribution.amount_cents * 100
    @recipient = Recipient.find(params[:recipient_id])

    # authorize @contribution
      # contribution  = Order.create!(teddy_sku: teddy.sku, amount: teddy.price, state: 'pending', user: current_user)

    @contribution.user = current_user
    @contribution.item = @item
      #   customer = Stripe::Customer.create(
      #     source: params[:stripeToken],
      #     email:  params[:stripeEmail]
      #   )

      #   charge = Stripe::Charge.create(
      #     customer:     customer.id,   # You should store this customer id and re-use it.
      #     amount:       @contribution.amount_cents,
      #     description:  " #{@contribution.item_sku} for contribution #{@contribution.id}",
      #     # currency:     @contribution.amount_cents.currency
      #   )

      #   @contribution.update(payment: charge.to_json, state: 'paid')
      #   redirect_to order_path(@contribution)

      # rescue Stripe::CardError => e
      #   flash[:alert] = e.message
      #   redirect_to new_order_payment_path(@contribution)
    if @contribution.save
      @item.total_contributions += @contribution.amount_cents
      @item.save
      redirect_to new_recipient_item_contribution_payment_path(@recipient, @item, @contribution)
    else
      render "new"
    end
  end

  # def edit
  #   # authorize @contribution
  # end

  def update
    # authorize @contribution
    @contribution = current_user.contributions.where(state: 'paid').find(params[:id])
    @contribution.update(message:params["contribution"][:message])
    if @contribution.save
      redirect_to recipient_item_path(params["recipient_id"], params["item_id"])
    else
      render "show"
    end
  end

  # def destroy
  #   # authorize @contribution
  #   @contribution.delete
  # end

  def show
    # authorize @contribution
    @contribution = current_user.contributions.where(state: 'paid').find(params[:id])
    @recipient = Recipient.find(params[:recipient_id])
  end

  private

  def set_contribution
    @contribution = Contribution.find(params[:id])
  end

  def contribution_params
    params.require(:contribution).permit(:amount_cents, :message)
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end

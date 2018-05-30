class ContributionsController < ApplicationController
  # before_action :set_contribution, except: [:new, :index, :create]
  before_action :set_item

  def new
    @recipient = Recipient.find(params[:recipient_id])
    @contribution = Contribution.new
  end

  def create
    @contribution = Contribution.new(contribution_params)
    @contribution.amount_cents = @contribution.amount_cents * 100
    # authorize @contribution
      # order  = Order.create!(teddy_sku: teddy.sku, amount: teddy.price, state: 'pending', user: current_user)

    @contribution.user = current_user
    @contribution.item = @item
    if @contribution.save
      redirect_to recipient_item_contribution_path(@contribution)
    else
      render "new"
    end
  end

  # def edit
  #   # authorize @contribution
  # end

  # def update
  #   # authorize @contribution
  #   @contribution.update(contribution_params)
  #   if @contribution.save
  #     redirect_to contribution_path
  #   else
  #     render "edit"
  #   end
  # end

  # def destroy
  #   # authorize @contribution
  #   @contribution.delete
  # end

  def show
    # authorize @contribution
    set_contribution
  end

  private

  def set_contribution
    @contribution = contribution.find(params[:id])
  end

  def contribution_params
    params.require(:contribution).permit(:amount_cents, :message)
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end

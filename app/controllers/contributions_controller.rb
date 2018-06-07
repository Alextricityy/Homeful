class ContributionsController < ApplicationController
  # before_action :set_contribution, except: [:new, :index, :create]
  before_action :set_item, except: [:show]

  def create
    @contribution = Contribution.new(contribution_params)
    @contribution.state = "pending"
    @contribution.amount_cents = @contribution.amount_cents * 100
    @recipient = Recipient.find(params[:recipient_id])

    @contribution.user = current_user
    @contribution.item = @item
    if @contribution.save
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
      redirect_to recipient_path(params["recipient_id"])
    else
      render "show"
    end
  end

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

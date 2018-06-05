class PaymentsController < ApplicationController
   before_action :set_contribution, except: [:new]

  def new
    set_recipient
    set_item
    # raise
    @contribution = current_user.contributions.where(state: 'pending').find(params[:contribution_id])
  end

  def create
    set_item
    set_recipient
    # raise
  customer = Stripe::Customer.create(
    source: params[:stripeToken],
    email:  params[:stripeEmail]
  )

  charge = Stripe::Charge.create(
    customer:     customer.id,   # You should store this customer id and re-use it.
    amount:       @contribution.amount_cents,
    description:  "Payment for contribution #{@contribution.id}",
    currency:     @contribution.amount.currency
  )

  @contribution.update(payment_info: charge.to_json, state: 'paid')
  @item.total_contributions += @contribution.amount_cents
  @item.save
  redirect_to recipient_item_contribution_path(@recipient, @item, @contribution)

  rescue Stripe::CardError => e
  flash[:alert] = e.message
  redirect_to new_recipient_item_contribution_payment_path(@recipient, @item, @contribution)
  end

private

  def set_contribution
    @contribution = Contribution.find(params[:contribution_id])
  end

  def set_recipient
    @recipient = Recipient.find(params[:recipient_id])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

end

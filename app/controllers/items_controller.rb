class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update]
  before_action :set_recipient

  def new
    @item = Item.new
    @recipient = Recipient.find(params[:recipient_id])
  end

  def create
    @item = Item.new(item_params)
    @item.recipient_id = params[:recipient_id].to_i
    if @item.save
      redirect_to recipient_item_path(@recipient, @item)
    else
      render "recipients/show"
    end
  end

  def show
    @item
  end

  def edit
    @item
  end

  def update
    @item.update(item_params)
    if @item.save
      redirect_to item_path(@item)
    else
      render "edit"
    end
  end

  private

  def item_params
    params.require(:item).permit(:title, :description, :category, :cost)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def set_recipient
    @recipient = Recipient.find(params[:recipient_id])
  end

end

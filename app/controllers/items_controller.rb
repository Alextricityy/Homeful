class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update]


  def create
    @item = Item.new(item_params)
    @item.recipient_id = params[:recipient_id].to_i
    if @item.save
      redirect_to item_path(@item)
    else
      render "recipients/show"
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
    @item = Item.find(params[:item_id])
  end

end

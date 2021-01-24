class ItemsController < ApplicationController
  def index
    # @items = Item.order("created_at DESC")
  end
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      reedirect_to root_path
    else
      render :new
    end
  end

private
  def item_params
    params.require(:item).permit(:name, :description, :price, :category_id, :status_id, :shopping_fee_id, :prefecture_id, :delivery_days_id)
  end

end

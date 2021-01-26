class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :new
  def index
    @items = Item.order('created_at DESC').includes(:user)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :price, :category_id, :status_id, :shopping_fee_id, :prefecture_id,
                                 :delivery_days_id, :image).merge(user_id: current_user.id)
  end
end

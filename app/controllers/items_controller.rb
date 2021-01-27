class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :set_item, only: [:show, :edit, :update]
  
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
  end

  def edit
    unless @item.user_id == current_user.id
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(params[:id])
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :price, :category_id, :status_id, :shopping_fee_id, :prefecture_id,
                                 :delivery_days_id, :image).merge(user_id: current_user.id)
  end
  def set_item
    @item = Item.find(params[:id])
  end
end

class OrdersController < ApplicationController
#ApplicationControllerを継承してるから、いきなり他モデルを指定しても大丈夫。
  before_action :authenticate_user!, only: [:index]

  def index
    @item = Item.find(params[:item_id])
#ルーティングでネストされると、paramsで運ばれてくるidの形も変わる。routesで確認。
    @order_address = OrderAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new(params_check)
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      render action: :index
    end
  end

private
  def params_check
    params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :block_number, :building_name, :phone).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end

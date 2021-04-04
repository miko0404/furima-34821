class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def index
    @item = Item.find(params[:item_id])
    @order = Order.new
    if current_user == @item.user
      redirect_to root_path
    end
  end

  def create
    @item = Item.find(params[:item_id])
    @order = Order.new(order_params)
      if @order.valid?
         pay_item
         @order.save
         redirect_to root_path
         #redirect_to item_path
      else
        render :index
      end
   end

   private
    def order_params
      params.require(:order).permit(:post_code, :address_id, :city, :city_number, :building_name, :phone_number, :user_buy_address, :exhibition_price).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
    end

    def pay_item
      Payjp.api_key = "sk_test_46403c5bea045993d15b9882"  
      Payjp::Charge.create(
        amount: @item.exhibition_price, 
        card: order_params[:token],
        currency: 'jpy'  
      )
    end
end

class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def index
    @items = Item.all 
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(items_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end
  
  private
  def items_params
    params.require(:item).permit(:image, :item_name, :item_explanation, :category_id, :item_status_id, :postage_payer_id, :address_id, :days_shipping_id, :exhibition_price).merge(user_id: current_user.id)
  end
end
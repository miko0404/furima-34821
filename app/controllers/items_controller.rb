class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :set_item, only:[:show]
  

  def index
    @items = Item.includes(:user).order("created_at DESC")
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

  def show
    
  end
  
  private
  def items_params
    params.require(:item).permit(:image, :item_name, :item_explanation, :category_id, :item_status_id, :postage_payer_id, :address_id, :days_shipping_id, :exhibition_price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end


  
end
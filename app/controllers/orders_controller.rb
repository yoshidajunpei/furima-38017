class OrdersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @item = Item.find(params[:item_id])
    if current_user != @item.user
     @purchase_delivery = PurchaseDelivery.new
    else
      redirect_to root_path
    end 
  end
  
  # def new
  #   @order = ParchaseDelivery.new  #.newで空のインスタンスを作成している。
  #   # @parchase_delivery = ParchaseDelivery.new
  # end
  
  def create
    @item = Item.find(params[:item_id])
    if current_user != @item.user
      redirect_to root_path
    else
    @purchase_delivery = PurchaseDelivery.new(order_params)
    if @purchase_delivery.valid?
       @purchase_delivery.save
       redirect_to root_path
    else
       render :index
    end
   end
  end
  
  
  
  private
  
  def order_params
    params.require(:purchase_delivery).permit(:postal_code,:prefecture_id,:municipality,:address,:building,:phone_number).merge(user_id:current_user.id,item_id:params[:item_id])
  end
  
  end


class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :all_item, only: [:index, :create]
  before_action :user_item, only: [:index, :create]
  before_action :sold_item, only: [:index, :create]

  def index
    @purchase_delivery = PurchaseDelivery.new 
  end

  def create
    @purchase_delivery = PurchaseDelivery.new(order_params)
    if @purchase_delivery.valid?
      @purchase_delivery.save
      pay_item
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:purchase_delivery).permit(:postal_code, :prefecture_id, :municipality, :address, :building, :phone_number).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def all_item
    @item = Item.find(params[:item_id])
  end

  def user_item
    redirect_to root_path if current_user.id == @item.user_id # ＜学習メモ＞ログインユーザーと出品者が一緒の場合トップページへ遷移する
  end

  def sold_item
    redirect_to root_path if user_signed_in? && @item.purchase # ＜学習メモ＞購入済みだったらトップページへ遷移する
  end
end

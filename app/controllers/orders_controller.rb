class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :all_item, only: [:index, :create]
  before_action :user_item, only: [:index, :create]
  before_action :sold_item, only: [:index, :create]
  before_action :pay_customer, only: [:index, :create]
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
      user_id: current_user.id, item_id: params[:item_id], token: params[:card_token]
    )
  end

  def pay_item
    redirect_to new_card_path and return unless current_user.card.present?
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] # 環境変数を読み込む
    customer_token = current_user.card.customer_token # ログインしているユーザーの顧客トークンを定義
    Payjp::Charge.create(
      amount: @item.price, # 商品の値段
      customer: customer_token, # 顧客のトークン
      currency: 'jpy' # 通貨の種類（日本円）
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

  def pay_customer
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    card = Card.find_by(user_id: current_user.id)

    redirect_to new_card_path and return unless card.present?

    customer = Payjp::Customer.retrieve(card.customer_token)
    @card = customer.cards.first
  end
end
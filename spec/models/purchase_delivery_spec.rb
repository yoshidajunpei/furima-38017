require 'rails_helper'

RSpec.describe PurchaseDelivery, type: :model do
   before do 
    @purchase_delivery = FactoryBot.build(:purchase_delivery)
   end

  describe '購入記録と発送先情報が登録される場合' do
  end

it '郵便番号が空だと登録できない' do
  @purchase_delivery.postal_code = ''
  @purchase_delivery.valid?
  expect(@purchase_delivery.errors.full_messages).to include("Postal code is invalid")
end


it '都道府県が空だと登録できない' do
  @purchase_delivery.prefecture_id = ''
  @purchase_delivery.valid?
  expect(@purchase_delivery.errors.full_messages).to include("Prefecture can't be blank")
end

it '市町村が空だと登録できない' do
  @purchase_delivery.municipality = ''
  @purchase_delivery.valid?
  expect(@purchase_delivery.errors.full_messages). to include("Municipality can't be blank")
end

it '住所が空だと登録できない' do 
  @purchase_delivery.address = ''
  @purchase_delivery.valid?
  expect(@purchase_delivery.errors.full_messages).to include("Address can't be blank")
end

it '電話番号が空だと登録できない' do
  @purchase_delivery.phone_number = ''
  @purchase_delivery.valid?
  expect(@purchase_delivery.errors.full_messages).to include("Phone number can't be blank")
end

it '郵便番号は「３桁ハイフン４桁」の半角英数字でないと登録できない' do
  @purchase_delivery.postal_code = '111-11111'
  @purchase_delivery.valid?
  expect(@purchase_delivery.errors.full_messages).to include("Postal code is invalid")
end

it '電話番号は「10桁以上11桁以内の半角英数字でないと登録できない」' do
  @purchase_delivery.phone_number = '08011111111111'
  @purchase_delivery.valid?
  expect(@purchase_delivery.errors.full_messages).to include("Phone number is invalid")
end

it 'tokenが空では登録できない' do
@purchase_delivery.token = ''
@purchase_delivery.valid?
expect(@purchase_delivery.errors.full_messages).to include("Token can't be blank")
end


end
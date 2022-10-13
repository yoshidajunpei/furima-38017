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

it '郵便番号は「３桁ハイフン４桁」の半角英数字でないと登録できない'
  @parchase_delivery.postal_code = "{/\A\d{3}[-]\d{4}\z/}"
end

it '電話番号は「10桁以上11桁以内の半角英数字でないと登録できない」'
end


end






# ーブル
# | Column             | Type       | Options                        |
# | ------------------ | ---------- | ------------------------------ |
# | item               | references | null: false, foreign_key: true |
# | user               | references | null: false, foreign_key: true |
# ###アソシエーション
# - belongs_to    :item
# - has_one       :delivery
# - belongs_to    :user

# ##deliveriesテーブル
# | Column             | Type       | Options                        |
# | ------------------ | ---------- | ------------------------------ |
# | postal_code        | string     | null: false,                   |
# | prefecture_id      | integer    | null: false,                   |
# | municipality       | string     | null: false,                   |
# | address            | string     | null: false,                   |
# | building           | string     |                                |
# | phone_namber       | string     | null: false,                   |
# | purchase            | references | null: false, foreign_key: true |
# ###アソシエーション
# - belongs_to  :purchase
# - belongs_to_active_hash :prefecture_id
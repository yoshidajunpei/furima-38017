require 'rails_helper'

RSpec.describe PurchaseDelivery, type: :model do
  describe '購入管理テーブルの保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @purchase_delivery = FactoryBot.build(:purchase_delivery, user_id: user.id, item_id: item.id)
      sleep 0.2
    end

    context '内容に問題ない場合 ' do
      it '全ての値が正しく入力されていたら登録できる' do
        expect(@purchase_delivery).to be_valid
      end

      it '建物名が空でも登録できる' do
        @purchase_delivery.building = ''
        expect(@purchase_delivery).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it '郵便番号が空だと登録できない' do
        @purchase_delivery.postal_code = ''
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include('Postal code is invalid')
      end

      it '郵便番号が半角ハイフンを含む形でなければ購入できない' do
        @purchase_delivery.postal_code = '1111111'
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include('Postal code is invalid')
      end

      it '都道府県が空だと登録できない' do
        @purchase_delivery.prefecture_id = ''
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '都道府県に「---」が選択されている場合は購入できない' do
        @purchase_delivery.prefecture_id = '1'
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '市町村が空だと登録できない' do
        @purchase_delivery.municipality = ''
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Municipality can't be blank")
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
        expect(@purchase_delivery.errors.full_messages).to include('Postal code is invalid')
      end

      it '電話番号が9桁以下では購入できない' do
        @purchase_delivery.phone_number = '0801111'
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include('Phone number is invalid')
      end

      it '電話番号が12桁以上では購入できない' do
        @purchase_delivery.phone_number = '0801111111111111'
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include('Phone number is invalid')
      end

      it '電話番号に半角数字以外が含まれている場合は購入できない（※半角数字以外が一文字でも含まれていれば良い）' do
        @purchase_delivery.phone_number = 'a8011111111111'
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include('Phone number is invalid')
      end

      it 'tokenが空では登録できない' do
        @purchase_delivery.token = ''
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Token can't be blank")
      end

      it 'userが紐付いていなければ購入できない' do
        @purchase_delivery.user_id = nil
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("User can't be blank")
      end

      it 'itemが紐付いていなければ購入できない' do
        @purchase_delivery.item_id = nil
        @purchase_delivery.valid?
        expect(@purchase_delivery.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end

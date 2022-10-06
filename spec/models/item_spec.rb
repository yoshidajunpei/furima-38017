require 'rails_helper'

RSpec.describe Item, type: :model do
  
  before do
    @item = FactoryBot.build(:item)
  end
  

  describe '商品新規登録' do

    it '商品名が空では登録できない' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it '商品説明が空では登録できない' do
      @item.description = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end

    it '価格が空では登録できない' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it 'カテゴリーが空では登録できない' do
    @item.category_id = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Category can't be blank")
    end

    it '商品の状態が空では登録できない' do
    @item.status_id = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Status can't be blank")
    end

    it '配送料の負担が空では登録できない' do
    @item.delivery_cost_id = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Delivery cost can't be blank")
    end

    it '発送元の地域が空では登録できない' do
      @item.prefecture_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture can't be blank")
    end

    it '発送までの日が空では登録できない' do
    @item.delivery_date_id = ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Delivery date can't be blank")
    end

    it '価格に半角数字以外が含まれている場合は出品できない（※半角数字が１文字でも含まれていればよい）' do
      @item.price = 'a'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end

    it '価格が300円未満では出品できない' do
      @item.price = '299'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
    end

    it '価格が9,999,999を超えると出品できない' do
      @item.price = '10000000'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
    end
  
    it 'カテゴリーに「---」が選択されている場合は出品できない' do
      @item.category_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end

    it '商品の状態に「---」が選択されている場合は出品できない' do
      @item.status_id= '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Status can't be blank")
    end

    it '配送料の負担に「---」が選択されている場合は出品できない' do
      @item.delivery_cost_id  = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery cost can't be blank")
    end

    it '発送元の地域に「---」が選択されている場合は出品できない' do
      @item.prefecture_id  = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture can't be blank")
    end

    it '発送までの日に「---」が選択されている場合は出品できない' do
      @item.delivery_date_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery date can't be blank")
    end
    
    it '画像がないと出品できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it '出品者が紐づいていないと出品できない' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("User must exist")
    end

  end
end


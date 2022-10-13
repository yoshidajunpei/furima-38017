class PurchaseDelivery
  
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :postal_code, :prefecture_id, :municipality, :address, :building, :phone_number
  #学習メモ：空のインスタンスの中のキーを設定する
  
  with_options presence: true do
    validates :item_id                   
    validates :user_id           
    validates :postal_code,  format: {with: /\A\d{3}[-]\d{4}\z/}         
    validates :prefecture_id,  numericality: { other_than: 1 , message: "can't be blank"}
    validates :municipality         
    validates :address              
    validates :phone_number,   format: {with: /\A\d{10}$|^\d{11}\z/}   
  end

  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id) #学習メモ：左がカラム名、右がビューの中で設定しているキー
    Delivery.create(postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, address: address, phone_number: phone_number, building: building, purchase_id:purchase.id)
  end
end



# ##purchasesテーブル
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
# | purchase           | references | null: false, foreign_key: true |
# ###アソシエーション
# - belongs_to  :purchase
# - belongs_to_active_hash :prefecture_id



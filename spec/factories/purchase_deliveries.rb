FactoryBot.define do
  factory :purchase_delivery do
    postal_code         {111-1111}
    prefecture_id       {2}
    municipality        {"北海道"}
    address             {"旭川市"}
    phone_number        {'080-1111-1111'}
    
    
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
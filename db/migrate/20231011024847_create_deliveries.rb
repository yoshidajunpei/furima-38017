class CreateDeliveries < ActiveRecord::Migration[6.0]
  def change
    create_table :deliveries do |t|
      t.string             :postal_code,           null: false
      t.integer            :prefecture_id,         null: false
      t.string             :municipality,          null: false
      t.string             :address,               null: false
      t.string             :building
      t.string             :phone_number,          null: false
      t.references         :purchase,              null: false, foreign_key: true        
      t.timestamps
    end
  end
end

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

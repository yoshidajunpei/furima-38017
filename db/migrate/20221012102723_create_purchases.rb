class CreatePurchases < ActiveRecord::Migration[6.0]
  def change
    create_table :purchases do |t|
      t.references           :item,     null: false, foreign_key: true
      t.references           :user,     null: false, foreign_key: true
      t.timestamps
    end
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
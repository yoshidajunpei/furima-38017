##usersテーブル
| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nick_name          | string | null: false               |
| first_name         | string | null: false               |
| first_name_kana    | string | null: false               |
| last_name          | string | null: false               |
| last_name_kana     | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_passward | string | null: false               |
| birth              | date   | null: false               |
###アソシエーション
- has_many   :items
- has_many   :purchases


##itemsテーブル
| Column             | Type      | Options                        |
| ------------------ | --------- | ------------------------------ |
| name               | string    | null: false,                   |
| description        | text      | null: false,                   |
| category_id        | integer   | null: false,                   |
| status_id          | integer   | null: false,                   |
| price              | integer   | null: false,                   |
| delivery_cost_id   | integer   | null: false,                   |
| prefecture_id      | integer   | null: false,                   |
| delivery_date_id   | integer   | null: false,                   |
| user               | references| null: false, foreign_key: true |
###アソシエーション
- belongs_to   :user
- has_one      :purchas
- belongs_to_active_hash :category_id
- belongs_to_active_hash :status_id
- belongs_to_active_hash :delivery_cost_id
- belongs_to_active_hash :prefecture_id
- belongs_to_active_hash :delivery_date_id


##purchasテーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| item               | references | null: false, foreign_key: true |
| user               | references | null: false, foreign_key: true |
###アソシエーション
- belongs_to    :item
- has_one       :delivery
- belongs_to    :user

##deliverysテーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| postal_code        | string     | null: false,                   |
| prefecture_id      | integer    | null: false,                   |
| municipality       | string     | null: false,                   |
| address            | string     | null: false,                   |
| building           | string     |                                |
| phone_namber       | string     | null: false,                   |
| purchas            | references | null: false, foreign_key: true |
###アソシエーション
- belongs_to  :purchas
- belongs_to_active_hash :prefecture_id
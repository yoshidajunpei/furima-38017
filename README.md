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
| dob                | string | null: false               |
###アソシエーション
- has_many :items
- belongs_to :parches


##itemsテーブル
| Column             | Type      | Options                        |
| ------------------ | --------- | ------------------------------ |
| name               | string    | null: false, foreign_key: true |
| description        | text      | null: false, foreign_key: true |
| category_id        | integer   | null: false, foreign_key: true |
| status_id          | integer   | null: false, foreign_key: true |
| price              | integer   | null: false, foreign_key: true |
| delivery_cost_id   | integer   | null: false, foreign_key: true |
| prefecture_id      | integer   | null: false, foreign_key: true |
| delivery_date_id   | integer   | null: false, foreign_key: true |
###アソシエーション
- belong_to :users
- belongs_to   :parchases
- belongs_to_active_hash :category_id
- belongs_to_active_hash :status_id
- belongs_to_active_hash :delivery_cost_id
- belongs_to_active_hash :delivery_address_id
- belongs_to_active_hash :delivery_date_id


##parchasesテーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| item               | text       | null: false, foreign_key: true |
| user               | references | null: false, foreign_key: true |
###アソシエーション
- has_one :items
- has_one  :deliverys

##deliverysテーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| postal_code        | string     | null: false,                   |
| prefecture         | srting     | null: false,                   |
| municipality       | string     | null: false,                   |
| address            | string     | null: false,                   |
| building           | string     |                                |
| phone_namber       | integer    | null: false,                   |
###アソシエーション
- belongs_to  :parshases

##usersテーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nick_name          | string | null: false |
| first_name         | string | null: false |
| first_name_kana    | string | null: false |
| last_name          | string | null: false |
| last_name_kana     | string | null: false |
| mail               | string | null: false |
| encrypted_passward | string | null: false |
| dob                | string | null: false |
###アソシエーション
- has_many :items


##itemsテーブル
| Column             | Type      | Options                        |
| ------------------ | --------- | ------------------------------ |
| name               | string    | null: false                    |
| description        | string    | null: false                    |
| category           | string    | null: false                    |
| status             | string    | null: false                    |
| price              | string    | null: false                    |
###アソシエーション
- belong_to :users
- belong_to :parches

##parchesテーブル
| Column             | Type      | Options                        |
| ------------------ | --------- | ------------------------------ |
| phone_namber       | integer   | null: false, foreign_key: true |
| name               | text      | null: false, foreign_key: true |
| item               | text      | null: false, foreign_key: true |
| user               | reference | null: false, foreign_key: true |
###アソシエーション
- has_many :items
- has_one  :deliverys

##deliverysテーブル
| Column             | Type      | Options                        |
| ------------------ | --------- | ------------------------------ |
| postal_code        | string    | null: false, foreign_key: true |
| prefecture         | srting    | null: false, foreign_key: true |
| municipality       | string    | null: false, foreign_key: true |
| address            | string    | null: false, foreign_key: true |
| building           | string    | null: false, foreign_key: true | 
###アソシエーション
- has_one  :parshes

# usersテーブル

| Column             | Type   | Options                       |
| ------------------ | ------ | ----------------------------- |
| email              | string | null: false, unique: true     |
| encrypted_password | string | null: false                   |
| nickname           | string | null: false                   |
| last_name          | string | null: false                   |
| first_name         | string | null: false                   |
| last_name_kana     | string | null: false                   |
| first_name_kana    | string | null: false                   |
| birth_day          | date   | null: false                   |

has_many :items
has_many :purchases

# itemsテーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| name              | string     | null: false                    |
| category_id       | integer    | null: false                    |
| price             | integer    | null: false                    |
| user              | references | null: false                    |
| delivery_fee_id   | integer    | null: false                    |
| description       | text       | null: false                    |
| trading_status_id | integer    | null: false                    |
| shipping_area_id  | integer    | null: false                    |
| shipping_days_id  | integer    | null: false                    |

belongs_to :user
has_one :purchase

# shippingsテーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| address          | string     | null: false                    |
| post_code        | string     | null: false                    |
| shipping_area_id | integer    | null: false                    |
| city             | string     | null: false                    |
| building_name    | string     |                                |
| phone_number     | string     | null: false                    |
| purchase         | references | null: false                    |

belongs_to :purchase

# purchasesテーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| item          | references | null: false                    |

belongs_to :user
belongs_to :item
has_one :shipping
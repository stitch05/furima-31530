# usersテーブル

| Column          | Type   | Options                       |
| --------------- | ------ | ----------------------------- |
| email           | string | null: false, uniqueness: true |
| password        | string | null: false                   |
| nickname        | string | null: false                   |
| last_name       | string | null: false                   |
| first_name      | string | null: false                   |
| last_name_kana  | string | null: false                   |
| first_name_kana | string | null: false                   |
| birth_year      | string | null: false                   |
| birth_month     | string | null: false                   |
| birth_day       | string | null: false                   |

has_many :items
has_one :shipping

# itemsテーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| name           | string     | null: false                    |
| category       | reference  | null: false, foreign_key: true |
| price          | integer    | null: false                    |
| user           | references | null: false, foreign_key: true |
| delivery_fee   | integer    | null: false                    |
| brand          | references | null: false, foreign_key: true |
| size           | string     | null: false                    |
| item_image     | references | null: false, foreign_key: true |
| description    | text       | null: false                    |
| trading_status | integer    | null: false                    |
| shipping_area  | string     | null: false                    |
| shipping_days  | integer    | null: false                    |

belongs_to :user
belongs_to :category
belongs_to :brand
has_many :images

# shippingテーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| address         | string     | null: false                    |
| user            | references | null: false, foreign_key: true |
| last_name       | string     | null: false                    |
| first_name      | string     | null: false                    |
| last_name_kana  | string     | null: false                    |
| first_name_kana | string     | null: false                    |
| post_code       | string     | null: false                    |
| prefecture      | string     | null: false                    |
| city            | string     | null: false                    |
| building_name   | string     |                                |
| phone_number    | string     |                                |

belongs_to :user

# categoryテーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| ancestry | string |             |

has_many :items

# brandテーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |

has_many :items

# imagesテーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| image    | string     | null: false                    |
| item     | integer    | null: false, foreign_key: true |

belongs_to :items
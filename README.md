# usersテーブル

| Column     | Type   | Options  |
| ---------- | ------ | -------- |
| email      | string | not null |
| password   | string | not null |
| name       | string | not null |

# itemsテーブル

| Column       | Type       | Options  |
| ------------ | ---------- | -------- |
| name         | string     | not null |
| category     | text       | not null |
| price        | integer    | not null |
| user         | references |          |
| delivery_fee | integer    | not null |
# commentsテーブル

| Column    | Type       | Options  |
| --------- | ---------- | -------- |
| text      | text       | not null |
| user      | references |          |
| item      | references |          |

# deliveryテーブル

| Column    | Type       | Options  |
| --------- | ---------- | -------- |
| address   | string     | not null |
| user      | references |          |
| item      | references |          |


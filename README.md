# テーブル設計

## users テーブル

| Column                | Type   | Options     |
| --------------------- | ------ | ----------- |
| nickname              | string | null: false |
| email                 | string | null: false |
| password              | string | null: false |
| password_confirmation | string | null: false |
| firstname_kanji       | string | null: false |
| lastname_kanji        | string | null: false |
| firstname_katakana    | string | null: false |
| lastname_katakana     | string | null: false |
| birth_day_year        | string | null: false |
| birth_day_month       | string | null: false |
| birth_day_day         | string | null: false |

 ### Association

- has_many :items
- has_many :orders


## items テーブル

| Column           | Type       | Options     |
| ---------------- | ---------- | ----------- |
| image            | string     | null: false |
| name             | string     | null: false |
| text             | text       | null: false |
| category         | string     | null: false |
| quality          | integer    | null: false |
| who_pay          | integer    | null: false |
| delivery_area    | integer    | null: false |
| delivery_days    | integer    | null: false |
| price            | integer    | null: false |
| user             | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_one :order


## addresses テーブル

| Column        | Type       | Options     |
| ------------- | ---------- | ----------- |
| postal_code   | string     | null: false |
| prefecture	  | integer    | null: false |
| city	        | string     | null: false |
| house_number  | string     | null: false |
| building_name | string     |             |
| phone_number  | string     | null: false |

### Association

- belongs_to :order

## orders テーブル

| Column    | Type       | Options     |
| --------- | ---------- | ----------- |
| item      | references | null: false, foreign_key: true |
| user      | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

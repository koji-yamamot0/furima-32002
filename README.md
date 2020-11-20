
## usersテーブル

| Column              | Type    | Option      |
| ------------------- | --------| ----------- |
| nickname            | string  | null: false |
| email               | string  | null: false |
| encrypted_password  | string  | null: false |
| family_name         | string  | null: false |
| first_name          | string  | null: false |
| kana_family_name    | string  | null: false |
| kana_first_name     | string  | null: false |
| birthday            | date    | null: false |

### Association
- has_many :items
- has_many :comments
- has_many :purchasers

## itemsテーブル

| Column                | Type       | Option      |
| --------------------- | ---------- | ----------- |
| title                 | string     | null: false |
| category_id           | integer    | null: false |
| text                  | text       | null: false |
| price                 | integer    | null: false |
| user                  | references |             |
| delivery_fee          | integer    | null: false |
| ship_from_location_id | integer    | null: false |
| shipping_date_id      | integer    | null: false |
| item_status_id        | integer    | null: false |
| favorite              | integer    |             |

### Association
- belongs_to :user
- has_one :purchaser
- has_many :comments

## commentsテーブル

| Column | Type       | Option      |
| ------ | ---------- | ----------- |
| text   | text       | null: false |
| user   | references |             |
| item   | references |             |

### Association
- belongs_to :user
- belongs_to :item

## receiver's_addressesテーブル

| Column                 | Type    | Option      |
| ---------------------- | ------- | ----------- |
| postal                 | integer | null: false |
| prefecture             | string  | null: false |
| municipalities         | string  | null: false |
| address                | string  | null: false |
| building               | string  |             |
| telephone_number       | string  | null: false |

### Association
- belongs_to :purchaser

## purchaserテーブル

| Column                | Type       |
| --------------------- | ---------- |
| user                  | references |
| item                  | references |
| receiver's_address    | references |

### Association
- belongs_to :item
- belongs_to :user
- has_one :receiver's_address

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

| Column                | Type       | Option            |
| --------------------- | ---------- | ----------------- |
| title                 | string     | null: false       |
| category_id           | integer    | null: false       |
| text                  | text       | null: false       |
| price                 | integer    | null: false       |
| user                  | references | foreign_key: true |
| delivery_fee_id       | integer    | null: false       |
| ship_from_location_id | integer    | null: false       |
| shipping_date_id      | integer    | null: false       |
| item_status_id        | integer    | null: false       |
| favorite              | integer    |                   |

### Association
- belongs_to :user
- has_one :purchaser
- has_many :comments

## commentsテーブル

| Column | Type       | Option            |
| ------ | ---------- | ----------------- |
| text   | text       | null: false       |
| user   | references | foreign_key: true |
| item   | references | foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item

## destinationテーブル

| Column           | Type       | Option            |
| ---------------- | ---------- | ----------------- |
| postal           | string     | null: false       |
| prefecture_id    | integer    | null: false       |
| municipalities   | string     | null: false       |
| address          | string     | null: false       |
| building         | string     |                   |
| telephone_number | string     | null: false       |
| purchaser        | references | foreign_key: true |

### Association
- belongs_to :purchaser

## purchaserテーブル

| Column                | Type       | Option            |
| --------------------- | ---------- | ----------------- |
| user                  | references | foreign_key: true |
| item                  | references | foreign_key: true |

### Association
- belongs_to :item
- belongs_to :user
- has_one :destination

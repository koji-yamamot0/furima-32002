
## usersテーブル

| Column    | Type    | Option      |
| --------- | --------| ----------- |
| nickname  | string  | null: false |
| email     | string  | null: false |
| password  | string  | null: false |
| name      | string  | null: false |
| kana_name | string  | null: false |
| birthday  | integer | null: false |

### Association
- has_many :items
- has_many :comments
- has_many :purchasers

## itemsテーブル

| Column             | Type       | Option      |
| ------------------ | ---------- | ----------- |
| title              | string     | null: false |
| category           | string     | null: false |
| text               | text       | null: false |
| price              | integer    | null: false |
| user               | references |             |
| delivery_fee       | integer    | null: false |
| ship_from_location | string     | null: false |
| shipping_date      | integer    | null: false |
| favorite           | integer    | null: false |

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

## purchasersテーブル

| Column                 | Type    | Option      |
| ---------------------- | ------- | ----------- |
| credit_card_number     | integer | null: false |
| credit_card_expiration | integer | null: false |
| credit_card_code       | integer | null: false |
| postal                 | integer | null: false |
| prefecture             | string  | null: false |
| municipalities         | string  | null: false |
| address                | integer | null: false |
| building               | string  |             |
| telephone_number       | integer | null: false |

### Association
- belongs_to :item
- belongs_to :user
## テーブル名

## users名

| Column             | Type   | Options|
| -----------------  | ------ |---------------------------|
| nickname           | string | null: false               |
| email              | string | null: false , unique: true|
| encrypted_password | string | null: false               |
| first_name         | string | null: false               |
| last_name          | string | null: false               |
| first_name_kana    | string | null: false               |
| last_name_kana     | string | null: false               |
| birthday           | date   | null: false               |
### Association
has_many :items
has_one :address



## itemsテーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| item_name         | string     | null: false                    |
| item_explanation  | text       | null: false                    |
| category_id       | integer    | null: false                    |
| item_status_id    | integer    | null: false                    |
| postage_payer_id  | integer    | null: false                    |
| days_shipping_id  | integer    | null: false                    |
| exhibition_price  | integer    | null: false                    |   
| user              | references | null: false, foreign_key: true |
| address_id        | integer    | null: false                    |
   ### Association

has_one :order
belongs_to :user


## addresses テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| order          | references | null: false, foreign_key: true |
| post_code      | string     | null: false                    |    
| prefecture_id  | integer    | null: false                    | 
| city           | string     | null: false                    | 
| city_number    | string     | null: false                    | 
| building_name  | string     |                                | 
| phone_number   | string     | null: false                    | 

### Association

 belongs_to :order

## comments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| comment | text       | null: false                    |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association

belongs_to :item
belongs_to :user

## orders テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association

belongs_to :item
belongs_to :user
has_one    :address


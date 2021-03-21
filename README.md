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
| birth_year         | string | null: false               |
| birth_month        | string | null: false               |
| birth_day          | string | null: false               |
### Association
has_many :items
has_many :orders
has_one :addresses
has_one :cards



## itemsテーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| item_name         | string     | null: false                    |
| item_explanation  | text       | null: false                    |
| category_id       | integer    | null: false                    |
| item_status_id    | integer    | null: false                    |
| postage_payer_id  | integer    | null: false                    |
| days_shipping_    | integer    | null: false                    |
| exhibition_price  | integer    | null: false                    |   
| user              | references | null: false, foreign_key: true |
| address           | integer    | null: false                    |
   ### Association

has_many :images
has_one :orders
belongs_to :users


## addresses テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| orders         | references | null: false, foreign_key: true |
| post_code      | string     | null: false                    |    
| prefecture_id  | integer    | null: false                    | 
| city           | string     | null: false                    | 
| city_number    | string     | null: false                    | 
| building_name  | string     |                                | 
| phone_number   | string     | null: false                    | 

### Association

 belongs_to :user

## comments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| comment | text       | null: false                    |
| user_id | references | null: false, foreign_key: true |
| item_id | references | null: false, foreign_key: true |

### Association

belongs_to :item
belongs_to :user

## orders テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user_id | references | null: false, foreign_key: true |
| item_id | references | null: false, foreign_key: true |

### Association

 belongs_to :item
belongs_to :user


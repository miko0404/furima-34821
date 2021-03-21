## テーブル名

## users名

| Column            | Type| Options|
| ----------------- | ------ |-------------|
| nickname          | string | null: false |
| email             | string | null: false |
| password          | string | null: false |
| first_name        | string | null: false |
| last_name         | string | null: false |
| first_name_kana   | string | null: false |
| last_name_kana    | string | null: false |

### Association
has_many :items
has_many :orders
has_one :addresses
has_one :cards



## itemsテーブル

| Column            | Type    | Options     |
| ----------------- | ------- | ----------- |
| item_name         | string  | null: false |
| item_explanation  | text    | null: false |
| category          | integer | null: false |
| item_status       | integer | null: false |
| postage_payer     | integer | null: false |
| days_shipping     | integer | null: false |
| exhibition_price  | integer | null: false |   
| user_id           | 
  
   ### Association

has_many :images
has_one :orders
belongs_to :users

## images テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| images   | text       | null: false                    | 
| item_id  | references | null: false, foreign_key: true |

### Association

 belongs_to :orders
 belongs_to items

## addresses テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| user_id        | references | null: false, foreign_key: true |
| post_code      | string     | null: false                    |    
| prefecture     | string     | null: false                    | 
| city           | string     | null: false                    | 
| city_number    | string     | null: false                    | 
| building_name  | string     | null: false                    | 
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

## cards テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user_id | references | null: false, foreign_key: true |
| item_id | references | null: false, foreign_key: true |

### Association

belongs_to :item
belongs_to :user
=======
# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

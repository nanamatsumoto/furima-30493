#テーブル設計

##user　テーブル


| Column         | Type   | Options     |
| -------------- | ------ | ----------- |
| email          | string | null: false |
| nickname       | string | null: false |
| password       | string | null: false |
| last_name      | string | null: false |
| first_name     | string | null: false |
| last_name_kana | string | null: false |
| first_name_kana| string | null: false |
| birth_date     | date   | null: false |

has_many :items
has_many :purchases

##items テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| title             | string     | null: false                    |
| category_id       | integer    | null: false                    |
| condition_id      | integer    | null: false                    |
| postage_id        | integer    | null: false                    |
| price             | integer    | null: false                    |
| region_id         | integer    | null: false                    |
| shipping_date_id  | integer    | null: false                    |
| user              | references | null: false, foreign_key: true |
| text              | text       | null: false                    |

belongs_to :user
belongs_to_active_hash :category
belongs_to_active_hash :condition
belongs_to_active_hash :postage	
belongs_to_active_hash :region	
belongs_to_active_hash :shipping_date
has_one :purchase

##purchases

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| item           | references | null: false, foreign_key: true |
| user           | references | null: false, foreign_key: true |

belongs_to :user
belongs_to :item
has_one :address

## addresses

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| post_code      | string     | null: false                    |
| prefectures_id | integer    | null: false                    |
| city           | string     | null: false                    |
| house_number   | string     | null: false                    |
| building_name  | string     |                                |
| phone_number   | string     | null: false,unique:true        |
| purchase       | references | null: false, foreign_key: true |

belongs_to :purchase
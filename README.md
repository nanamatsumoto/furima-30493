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

##items テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| name           | string     | null: false                    |
| category_id    | integer    | null: false                    |
| condition_id   | integer    | null: false                    |
| postage        | integer    | null: false                    |
| price          | integer    | null: false                    |
| region         | integer    | null: false                    |
| shipping_date  | integer    | null: false                    |
| seler_id       | references | null: false, foreign_key: true |
| introduction   | text       | null* false                    |

##purchases

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| item           | references | null: false, foreign_key: true |
| user           | references | null: false, foreign_key: true |
| buyer_id       | references | null: false, foreign_key: true |

## addresses

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| post_code      | string     | null: false,                   |
| perfectures    | intege     | null: false, foreign_key: true |
| city           | string     | null: false,                   |
| building_name  | string     | null: false,                   |
| phone_number   | string     | null: false,uniquenss:true     |
| purchase       | references | null: false, foreign_key: true |
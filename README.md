# DB 設計

## users table

| Column             | Type                | Options                        |
|--------------------|---------------------|--------------------------------|
| email              | string              | null: false, unique: true      |
| encrypted_password | string              | null: false                    |
| nickname           | string              | null: false                    |
| birth_date         | date                | null: false                    |
| last_name          | string              | null: false                    |
| first_name         | string              | null: false                    |
| last_name_kana     | string              | null: false                    |
| first_name_kana    | string              | null: false                    |


### Association

* has_many :buys
* has_many :items


## items table

| Column                 | Type                | Options                        |
|------------------------|---------------------|--------------------------------|
| name                   | string              | null: false                    |
| info                   | text                | null: false                    |
| price                  | integer             | null: false                    |
| category_id            | integer             | null: false                    |
| sales_status_id        | integer             | null: false                    |
| shipping_fee_status_id | integer             | null: false                    |
| prefecture_id          | integer             | null: false                    |
| Scheduled_delivery_id  | integer             | null: false                    |
| user                   | references          | null: false, foreign_key: true |


### Association

* belongs_to :user
* has_one :buy


## buys table

| Column             | Type                | Options                        |
|--------------------|---------------------|--------------------------------|
| user               | references          | null: false, foreign_key: true |
| item               | references          | null: false, foreign_key: true |


### Association

* belongs_to :user
* has_one :shipping_inform
* belongs_to :item


## shipping_informs table

| Column             | Type                | Options                        |
|--------------------|---------------------|--------------------------------|
| postal_code        | string              | null: false                    |
| prefecture_id      | integer             | null: false                    |
| city               | string              | null: false                    |
| addresses          | string              | null: false                    |
| building           | string              |                                |
| phone_number       | string              | null: false                    |
| buy                | references          | null: false, foreign_key: true |


### Association

* belongs_to :buy
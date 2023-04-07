# DB 設計

## users table

| Column             | Type                | Options                        |
|--------------------|---------------------|--------------------------------|
| email              | string              | null: false, unique: true      |
| encrypted_password | string              | null: false                    |
| nickname           | string              | null: false                    |
| birth date         | date                | null: false                    |
| last name          | string              | null: false                    |
| first name         | string              | null: false                    |
| last name kana     | string              | null: false                    |
| first name  kana   | string              | null: false                    |


### Association

* has_many :buys
* has_one :items


## items table

| Column             | Type                | Options                        |
|--------------------|---------------------|--------------------------------|
| image              |                     | null: false                    |
| name               | string              | null: false                    |
| info               | text                | null: false                    |
| price              | string              | null: false                    |
| category           | string              | null: false                    |
| sales status       | string              | null: false                    |
| shipping fee status| string              | null: false                    |
| prefecture         | string              | null: false                    |
| Scheduled delivery | date                | null: false                    |
| user               | references          | null: false, foreign_key: true |


### Association

* belongs_to :users


## buys table

| Column             | Type                | Options                        |
|--------------------|---------------------|--------------------------------|
| user               | references          | null: false, foreign_key: true |
| item               | references          | null: false, foreign_key: true |


### Association

* belongs_to :users
* has_one :shipping informs


## shipping informs table

| Column             | Type                | Options                        |
|--------------------|---------------------|--------------------------------|
| postal code        | string              | null: false                    |
| prefecture         | string              | null: false                    |
| city               | string              | null: false                    |
| item               | string              | null: false                    |
| addresses          | text                | null: false                    |
| building           | string              | null: false                    |
| phone number       | string              | null: false                    |
| buy                | references          | null: false, foreign_key: true |


### Association

* belongs_to :buys
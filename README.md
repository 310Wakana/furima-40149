## usersテーブル

|Column             |Type   |Options     |
|-------------------|-------|------------|
|name               |string |null: false |
|email              |string |null: false |
|encrypted_password |string |null: false |

### Association
has_many :items
has_many :records
has_one :address

## itemsテーブル

|Column    |Type      |Options                        |
|----------|----------|-------------------------------|
|image     |string    |null: false                    |
|item      |text      |null: false                    |
|concept   |text      |null: false                    |
|exhibitor |reference |null: false, foreign_key: true |


### Association
belongs_to :users
has_one :records

## recordsテーブル

|Column |Type      |Options                        |
|-------|----------|-------------------------------|
|record |reference |null: false, foreign_key: true |
|user   |reference |null: false, foreign_key: true |


### Association
belongs_to :users
belongs_to :items
has_one :address

## addressesテーブル

|Column  |Type      |Options                        |
|--------|----------|-------------------------------|
|address |reference |null: false, foreign_key: true |
|user    |reference |null: false, foreign_key: true |


### Association
belongs_to :users
belongs_to :address
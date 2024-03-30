## usersテーブル

|Column             |Type   |Options     |
|-------------------|-------|------------|
|nickname           |string |null: false |
|email              |string |null: false |
|encrypted_password |string |null: false |
|name_Kanji         |string |null: false |
|name_Kana          |string |null: false |
|date_of_birth      |string |null: false |

### Association
has_many :items
has_many :records

## itemsテーブル

|Column           |Type      |Options                        |
|-----------------|----------|-------------------------------|
|item             |string    |null: false                    |
|concept          |text      |null: false                    |
|category         |string    |null: false                    |
|state            |string    |null: false                    |
|delivery_charges |string    |null: false                    |
|prefecture       |string    |null: false                    |
|arrival_date     |string    |null: false                    |
|price            |string    |null: false                    |
|user             |reference |null: false, foreign_key: true |



### Association
belongs_to :user
has_one :record

## recordsテーブル

|Column |Type      |Options                        |
|-------|----------|-------------------------------|
|item   |reference |null: false, foreign_key: true |
|user   |reference |null: false, foreign_key: true |


### Association
belongs_to :user
belongs_to :item
has_one :address

## addressesテーブル

|Column       |Type      |Options                        |
|-------------|----------|-------------------------------|
|postal_code  |string    |null: false                    |
|prefecture   |string    |null: false                    |
|municipality |string    |null: false                    |
|house_number |string    |null: false                    |
|building     |string    |                               |
|phone_number |string    |null: false                    |
|record       |reference |null: false, foreign_key: true |


### Association
belongs_to :record
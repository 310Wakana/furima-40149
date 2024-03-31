## usersテーブル

|Column             |Type   |Options                  |
|-------------------|-------|-------------------------|
|nickname           |string |null: false              |
|email              |string |null: false, unique:true |
|encrypted_password |string |null: false              |
|first_name         |string |null: false              |
|last_name          |string |null: false              |
|first_name_kana    |string |null: false              |
|last_name_kana     |string |null: false              |
|date_of_birth      |date   |null: false              |

### Association
has_many :items 
has_many :records

## itemsテーブル

|Column              |Type      |Options                        |
|--------------------|----------|-------------------------------|
|item                |string    |null: false                    |
|concept             |text      |null: false                    |
|category_id         |integer   |null: false                    |
|state_id            |integer   |null: false                    |
|delivery_charges_id |integer   |null: false                    |
|prefecture_id       |integer   |null: false                    |
|arrival_date_id     |integer   |null: false                    |
|price               |integer   |null: false                    |
|user                |references|null: false, foreign_key: true |



### Association
belongs_to :user
has_one :record

## recordsテーブル

|Column |Type       |Options                        |
|-------|-----------|-------------------------------|
|item   |references |null: false, foreign_key: true |
|user   |references |null: false, foreign_key: true |


### Association
belongs_to :user
belongs_to :item
has_one :address

## addressesテーブル

|Column         |Type       |Options                        |
|---------------|-----------|-------------------------------|
|postal_code    |string     |null: false                    |
|prefecture_id  |integer    |null: false                    |
|municipality   |string     |null: false                    |
|house_number   |string     |null: false                    |
|building       |string     |                               |
|phone_number   |string     |null: false                    |
|record         |references |null: false, foreign_key: true |


### Association
belongs_to :record
# テーブル設計

## usersテーブル

|Column   |Type   |Option      |
|---------|-------|------------|
|nickname |string |null: false |
|email    |string |null: false |
|password |string |null: false |

### Association

- has_many :records 
- has_many :payments

## to_dosテーブル

|Column   |Type    |Option                   |
|---------|--------|-------------------------|
|content  |string  |null: false, unique:true |
|price    |integer |null: false              |

### Association

- has_many :to_dos

## recordテーブル

|Column     |Type       |Option                         |
|---------|-----------|-------------------------------|
|date     |date       |null: false                    |
|times    |integer    |null: false                    |
|to_do_id |references |null: false                    |
|user-id  |references |null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :to_do
- has_one : payment

## paymentsテーブル

|Column      |Type       |Option                         |
|------------|-----------|-------------------------------|
|date        |date       |null: false                    |
|user_id     |references |null: false, foreign_key: true |
|record_id   |references |null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :record
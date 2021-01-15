# テーブル設計

## usersテーブル

| Column    | Type    | Options     |
| --------- | ------- | ----------- |
| name      | string  | null: fales |
| email     | string  | null: fales |
| password  | string  | null: fales |

### Association

- has_many :room_users
- has_many :rooms, through: room_users
- has_many :messages

## roomsテーブル

| Column | Type    | Options     |
| ------ | ------- | ----------- |
| name   | string  | null: fales |

### Association

- has_many :room_users
- has_many :users, through: room_users
- has_many :messages

## room_usersテーブル

| Column    | Type      | Options                       |
| --------- | --------- | ----------------------------- |
| user      | reference | null:fales, foreign_key: true |
| room      | reference | null:fales, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user

## messagesテーブル

| Column    | Type      | Options                       |
| --------- | --------- | ----------------------------- |
| content   | string    | nll: fales, foreign_key: true |
| user      | reference | null:fales, foreign_key: true |
| room      | reference | null:fales, foreign_key: true |

### Association

- belongs_to :room
- berongs_tO :user

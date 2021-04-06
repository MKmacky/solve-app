# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |
| gender   | string | null: false |
| age      | string | null: false |
| position | string | null: false |

### Association

- has_many :problem_users
- has_many :problems, through: problem_users
- has_many :comments

## problems テーブル

| Column  | Type   | Options     |
| ------  | ------ | ----------- |
| title   | string | null: false |
| content | string | null: false |

### Association

- has_many :problem_users
- has_many :users, through: problem_users
- has_many :comments

## problem_users テーブル

| Column  | Type       | Options                        |
| ------  | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| problem | references | null: false, foreign_key: true |

### Association

- belongs_to :problem
- belongs_to :user

## comments テーブル

| Column   | Type       | Options                        |
| -------  | ---------- | ------------------------------ |
| solution | text       |                                |
| user     | references | null: false, foreign_key: true |
| room     | references | null: false, foreign_key: true |

### Association

- belongs_to :problem
- belongs_to :user
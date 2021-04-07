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

- has_many :problems
- has_many :comments


## problems テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| title    | string | null: false |
| content  | string | null: false |
| category | string | null: false |

### Association

- belongs_to :user
- has_many   :comments


## comments テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| solution | text       |                                |
| user     | references | null: false, foreign_key: true |
| room     | references | null: false, foreign_key: true |

### Association

- belongs_to :problem
- belongs_to :user
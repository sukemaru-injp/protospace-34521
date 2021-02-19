# README

## users

| Column    | type     | options              |
| --------- | -------- | -------------------- |
| email     | string   | null: false          |
| password  | string   | null: false          |
| name      | string   | null: false          |
| profile   | text     | null: false          |
| occupation| text     | null: false          |
| position  | text     | null: false          |

### association

- has_many :tweets
- has_many :comments

## comments

| Column    | type       | options                        |
| --------- | ---------- | ------------------------------ |
| text      | text       | null: false                    |
| user      | references | null: false, foreign_key: true |
| tweet     | references | null: false, foreign_key: true |

### association

- belongs_to :user
- belongs_to :tweet

## tweets

| Column     | type       | options                        |
| ---------- | ---------- | ------------------------------ |
| title      | string     | null: false                    |
| catch_copy | text       | null: false                    |
| concept    | text       | null: false                    |
| user       | references | null: false, foreign_key: true |

### association

- has_many :comments
- belongs_to :user



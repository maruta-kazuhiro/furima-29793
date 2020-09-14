# テーブル設計

## users テーブル

| Column           | Type     | Options                          |
| ---------------  | -------- | -------------------------------- |
| nickname         | string   | null:false                       |
| email            | string   | null:false                       |
| password         | string   | null:false                       |
| family_name      | string   | null:false                       |
| first_name       | string   | null:false                       |
| family_name_kana | string   | null:false                       |
| first_name_kana  | string   | null:false                       |
| birthday         | date     | null:false                       |

### Association

- has_many : items
- has_many : purchases

## items テーブル

| Column              | Type       | Options                          |
| ------------------- | ---------- | -------------------------------- |
| name                | string     | null:false                       |
| price               | integer    | null:false                       |
| introduction        | text       | null:false                       |
| user                | references | null:false, foreign_key:true     |
| category_id         | integer    | null:false                       |
| condition_id        | integer    | null:false                       |
| shipping_fee_id     | integer    | null:false                       |
| shipping_from_id    | integer    | null:false                       |
| date_ of_shipment_id| integer    | null:false                       |

### Association

- belongs_to : user
- has_one : purchase

## purchases テーブル

| Column           | Type       | Options                          |
| ---------------- | ---------- | -------------------------------- |
| user             | references | null:false, foreign_key:true     |
| items            | references | null:false, foreign_key:true     |

### Association

- belongs_to : user
- belongs_to : item
- has_one : destination

## destination テーブル

| Column           | Type       | Options                          |
| ---------------- | ---------- | -------------------------------- |
| postal_code      | string     | null:false                       |
| prefecture_id    | integer    | null:false                       |
| municipalities   | string     | null:false                       |
| address          | string     | null:false                       |
| building         | string     |                                  |
| telephone_number | string     | null:false                       |
| purchase         | references | null:false, foreign_key:true     |

### Association

- has_many : purchases
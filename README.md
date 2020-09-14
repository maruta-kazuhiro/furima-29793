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
| birthday         | datetime | null:false                       |

### Association

- has_many : items
- has_many : purchase

## items テーブル

| Column           | Type       | Options                          |
| ---------------- | ---------- | -------------------------------- |
| name             | string     | null:false                       |
| image            | string     | null:false                       |
| price            | integer    | null:false                       |
| introduction     | text       | null:false                       |
| user_id          | references | null:false, foreign_key:true     |
| category         | string     | null:false                       |
| bland            | string     | null:false                       |
| condition        | string     | null:false                       |
| shipping_fee     | integer    | null:false                       |
| shipping_from    | text       | null:false                       |
| date_ of_shipment| datetime   | null:false                       |

### Association

- belong_to : users
- has_one : purchase

## purchase テーブル

| Column           | Type       | Options                          |
| ---------------- | ---------- | -------------------------------- |
| user_id          | references | null:false, foreign_key:true     |
| items_id         | references | null:false, foreign_key:true     |

### Association

- belong_to : users
- belong_to : items
- has_one : destination

## destination テーブル

| Column           | Type       | Options                          |
| ---------------- | ---------- | -------------------------------- |
| shipping_adress  | string     | null:false                       |
| purchase_id      | references | null:false, foreign_key:true     |

### Association

- has_many : items
- has_many : purchase
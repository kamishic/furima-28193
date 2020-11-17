## Users
| Column      | Type   | Options|
| ----------  | ------ | -----------                |
| firstname   | string | null:false                 |
| lastname    | string | null:false                 |
| kana_firstname        | string | null:false                 |
| kana_lastname        | string | null:false                 |
| nickname    | string | null:false                 |
| email       | string | null:false,unique:true     |
| birthday    | date | null:false                 |
| password    | string | null:false                 |

### Association
- has_many :products
- has_many :purchases

## Products
|Column|Type|Options|
| ------ | ------ | ----------- |
|name|string|null:false|
|description|text|null:false|
|status_id|integer|null:false|
|category_id|integer|null:false|
|cost_ship_id|integer|null:false|
|day_to_ship_id|integer|null:false|
|area_from_ship_id|integer|null:false|
|price|integer|null:false|
|user|references|null:false,foreign_key:true|

### Association
- belongs_to :user
- has_one :purchase

## Purchases
|Column|Type|Options|
| ------ | ------ | ----------- |
|user|references|null:false,foreign_key:true|

### Association
- belongs_to :user
- belongs_to :product
- has_one :ship

## Ships
|Column|Type|Options|
| ------ | ------ | ----------- |
|zipcode|string|null:false|
|prefecture_id|integer|null:false|
|city|string|null:false|
|block|string|null:false|
|building|string|null:true|
|phone|string|null:false|
|purchase|references|null:false,foreign_key:true|

### Association
- belongs_to :purchase
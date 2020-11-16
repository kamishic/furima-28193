## Users
| Column      | Type   | Options|
| ----------  | ------ | -----------                |
| firstname   | string | null:false                 |
| lastname    | string | null:false                 |
| kana        | string | null:false                 |
| nickname    | string | null:false                 |
| email       | string | null:false,unique:true     |
| birthday    | string | null:false                 |
| password    | string | null:false                 |
| product_id  | references | null:false,foreign_key:true|
| purchase_id | references | null:false,foreign_key:true|

### Association
- has_many :product
- has_many :purchase

## Products
|Column|Type|Options|
| ------ | ------ | ----------- |
|name|string|null:false|
|description|string|null:false|
|status|string|null:false|
|category|string|null:false|
|cost_ship|string|null:false|
|day_to_ship|string|null:false|
|area_from_ship|string|null:false|
|price|integer|null:false|
|user_id|references|null:false,foreign_key:true|
|purchase_id|references|null:false,foreign_key:true|
|(image provided by ActiveStorage)||null:false|

### Association
- belongs_to :user
- has_one :purchase

## Purchases
|Column|Type|Options|
| ------ | ------ | ----------- |
|user_id|references|null:false,foreign_key:true|
|ship_id|references|null:false,foreign_key:true|

### Association
- belongs_to :user
- belongs_to :product
- has_one :ship

## Ships
| ------ | ------ | ----------- |
|Column|Type|Options|
|zipcode|string|null:false|


### Association
- belongs_to :purchase
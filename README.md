# README
## Users

|Column|Type|Options|
|------|----|-------|
|nikname|string|null:false|
|email|string|null:false,unique:true|
|encrypted_password|string|null:false|
|birth|date|null:false|
|last_name|string|null:false|
|last_name_katakana|string|null:false|
|name|string|null:false|
|name_katakana|string|null:false|


### Association
has_many :itmes
has_many :order

## Items

|Column|Type|Options|
|------|----|-------|
|item_name|string|null:false|
|category_id|integer|null:false|
|cost_id|integer|null:false|
|item_explanation|text|null:false|
|cost_load_id|integer|null:false|
|prefecture_id|integer|null:false|
|date_id|integer|null:false|
|price_id|integer|null:false|
|user|references|null:false,foreign_key:true|

### Association
belongs_to :user
has_one :order

## Orders

|Column|Type|Options|
|------|----|-------|
|user|references|null:false,foreign_key:true|
|item|references|null:false,foreign_key:true|

belongs_to :item
belongs_to :user
has_one :shipping

## Shippings

|Column|Type|Options|
|------|----|-------|
|post|string|null:false|
|prefecture_id|integer|null:false|
|municipality|string|null:false|
|construction|string|
|address|string|null:false|
|phone|string|null:false|
|order|references|null:false,foreign_key:true|

### Association
belongs_to :order
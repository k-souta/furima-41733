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
has_one :order

## Items

|Column|Type|Options|
|------|----|-------|
|item_name|string|null:false|
|category_id|integer|null:false|
|cost_id|integer|null:false|
|item_explanation|string|null:false|
|cost_load_id|integer|null:false|
|prefectures_id|integer|null:false|
|day_id|integer|null:false|
|price|string|null:false|
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

## Shippings

|Column|Type|Options|
|------|----|-------|
|post|string|null:false|
|prefectures_id|integer|null:false|
|municipality|string|null:false|
|construction|string|null:false|
|address|string|null:false|
|phone|string|null:false|
|orders|references|null:false,foreign_key:true|

### Association
belongs_to :order
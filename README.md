# README
## Users

|Column|Type|Options|
|------|----|-------|
|nikname|string|null:false|
|email|string|null:false,unique:true|
|encrypted_password|string|null:false|
|birth|string|null:false|

### Association
has_many :itmes

## Items

|Column|Type|Options|
|------|----|-------|
|item_name|string|null:false|
|categrie_id|integer|null:false|
|cost_id|integer|null:false|
|item_explanation|string|null:false|
|cost_load_id|integer|null:false|
|region_id|integer|null:false|
|day_id|integer|null:false|
|image|string|null:false|
|user|references|null:false,foreign_key:true|

### Association
belongs_to :user
has_one :order
has_one :shopping

## Orders

|Column|Type|Options|
|------|----|-------|
|shipping|references|null:false,foreign_key:true|
|item|references|null:false,foreign_key:true|

belongs_to :item
has_one :shipping

## Shippings

|Column|Type|Options|
|------|----|-------|
|price|string|null:false|
|post|string|null:false|
|prefectures_id|integer|null:false|
|municipality|string|null:false|
|address|string|null:false|
|phone|string|null:false|
|item|references|null:false,foreign_key:true|

### Association
belongs_to :order
belongs_to :item
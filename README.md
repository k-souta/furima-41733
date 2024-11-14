# README
## Users
|Column|Type|Options|
|------|----|-------|
|nikname|string|null:false|
|email|string|null:false,unque:true|
|password|string|null:false|

### Association
has_many :itmes

## Items

|Column|Type|Options|
|------|----|-------|
|item_name|string|null:false|
|categries|text|null:false|
|cost|text|null:false|
|seller|string|null:false|
|comment|text|null:false
|user_id|references|null:false,foreign_key:true|

### Association
belongs_to :user
has_one :orders

## Orders

|Column|Type|Options|
|------|----|-------|
|price|text|null:false|
|item_id|references|null:false,foreign_key:true|

belongs_to :item
has_one :shippings

## Shippings

|Column|Type|Options|
|------|----|-------|
|address|text|null:false|

### Association
belongs_to :order
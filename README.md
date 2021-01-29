# テーブル設計

  ## usersテーブル
｜ Column               | Type     | Option      |
｜ -------------------  | -----    | ----------- |
｜ email                | string   | null: false, unique:true
｜ encrypted_password   | string   | null: false |
｜ nickname             | string   | null: false |
｜ last_name            | string   | null: false |
｜ first_name           | string   | null: false |
｜ last_kana            | string   | null: false |
｜ first_kana           | string   | null: false |
｜ birthday             | date     | null: false |
 ### Association
- has_many :items
- has_many :orders


  ## itemsテーブル 
｜ Column           | Type       | Option      |
｜ ---------        | ---------  | ----------  |
｜ name             | string     | null: false |
｜ description      | text       | null: false |
｜ price            | integer    | null: false |
｜ category_id      | integer    | null: false | ★active hash
｜ status_id        | integer    | null: false | ★active hash
｜ shopping_fee_id  | integer    | null: false | ★active hash
｜ prefecture_id    | integer    | null: false | ★active hash(addressesテーブルと兼用)
｜ delivery_days_id | integer    | null: false | ★active hash
｜ bland_id         | integer    | null: false | ★active hash
｜ user(出品者)      | references | null: false,foreign_key:true
 ### Association
- has_one :order
- belongs_to :user
- belongs_to :category_id
- belongs_to :status_id
- belongs_to :shopping_fee_id
- belongs_to :prefecture_id
- belongs_to :delivery_days_id
- belongs_to :bland_id


 ## ordersテーブル (誰が購入したか、なんの商品を購入したか。購入履歴テーブル。)※出品者は、商品テーブルにuserの外部キーがあれば確認可能
｜ Column    | Type       | Option      |
｜ --------- | ---------  | ----------  |
｜ user      | references | null: false, foreign_key:true
｜ item      | references | null: false, foreign_key:true    
 ### Association
- belongs_to :user
- belongs_to :item
- has_one :address


  ## addressesテーブル 
｜ Column        | Type       | Option      |
｜ ---------     | ---------  | ----------  |
｜ postal_code   | string     | null: false |
｜ prefecture_id | integer    | null: false | ★active hash
｜ city          | string     | null: false |
｜ block_number  | string     | null: false |
｜ building_name | string     |             |
｜ phone         | string     | null: false |
｜ order         | references | null: false, foreign_key:true
 ### Association
- belongs_to :order

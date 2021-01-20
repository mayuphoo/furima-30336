# テーブル設計

  ## usersテーブル
｜ Column     | Type   | Option      |
｜ ---------  | -----  | ----------- |
｜ email      | string | null: false |
｜ password   | string | null: false |
｜ nickname   | string | null: false |
｜ last_name  | text   | null: false |
｜ first_name | text   | null: false |
｜ birthday   | date   | null: false |
 ### Association
- has_many :items
- has_many :orders
- has_one :card
- has_one :address


  ## addressesテーブル 
｜ Column       | Type       | Option      |
｜ ---------    | ---------  | ----------  |
｜ postal_code  | integer    | null: false |
｜ prefectures  | integer    | null: false | ★
｜ city         | string     | null: false |
｜ block_number | string     | null: false |
｜ building_name| string     | null: false |
｜ phone        | integer    | null: false |
｜ user_id      | references | null: false, foreign_key:true
 ### Association
- belongs_to :user



  ## cardsテーブル 
｜ Column           | Type       | Option      |
｜ ---------        | ---------  | ----------  |
｜ card_number      | integer    | null: false |
｜ expiration_year  | integer    | null: false |
｜ expiration_month | integer    | null: false |
｜ security_code    | integer    | null: false |
｜ user_id          | references | null: false, foreign_key:true 
 ### Association
- belongs_to :user



  ## itemsテーブル 
｜ Column           | Type       | Option      |
｜ ---------        | ---------  | ----------  |
｜ name             | string     | null: false |
｜ description      | text       | null: false |
｜ price            | integer    | null: false |
｜ category_id      | integer    | null: false |
｜ status_id        | integer    | null: false |
｜ shopping_fee_id  | integer    | null: false |
｜ delivery_days_id | integer    | null: false |
｜ bland_id         | integer    | null: false |
 ### Association
- has_many :orders
- belongs_to :user
- has_many :item_images
- belongs_to :category_id
- belongs_to :status_id
- belongs_to :shopping_fee_id
- belongs_to :shopping_area
- belongs_to :delivery_days
- belongs_to :bland_id



  ## item_imagesテーブル 
｜ Column         | Type       | Option      |
｜ ---------      | ---------  | ----------  |
｜ item_id        | references | null: false, foreign_key:true 
｜ item_images_id | string     | null: false |
 ### Association
- belongs_to :user


 ## ordersテーブル 
｜ Column    | Type       | Option      |
｜ --------- | ---------  | ----------  |
｜ seller_id | references | null: false, foreign_key:true 
｜ buyer_id  | references | null: false, foreign_key:true
｜ item_id   | references | null: false, foreign_key:true
 ### Association
- belongs_to :user
- belongs_to :item
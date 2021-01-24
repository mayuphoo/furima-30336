class Item < ApplicationRecord
 extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :category
    belongs_to :delivery_days
    belongs_to :prefecture
    belongs_to :shopping_fee
    belongs_to :status


  with_options presence: true do
    validates :name
    validates :description
    validates :price
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :delivery_days_id
    validates :prefecture_id
    validates :shopping_fee_id
    validates :staus_id
  end


end

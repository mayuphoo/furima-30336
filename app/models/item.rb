class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  belongs_to :delivery_days
  belongs_to :prefecture
  belongs_to :shopping_fee
  belongs_to :status
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :description
    validates :price
    validates :image
  end

  validates_inclusion_of :price, in: 300..9_999_999
  validates :price, format: { with: /\d/ }

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :delivery_days_id
    validates :prefecture_id
    validates :shopping_fee_id
    validates :status_id
  end
end

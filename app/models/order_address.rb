class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :block_number, :building_name, :phone, :user_id, :item_id, :token

  # ↑ここに定義すれば、急にカラム名を指定してもエラーにならず、Formオブジェクト内で使用できるようになる。

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'Input correctly' }
    validates :city
    validates :block_number
    validates :phone, format: { with: /\A\d{10,11}\z/, message: 'number is invalid' }
    validates :token
    validates :item_id
    validates :user_id
  end
  # creditのバリデーションも書く

  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, block_number: block_number,
                   building_name: building_name, phone: phone, order_id: order.id)
  end
end

class OrderForm
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :post, :prefecture_id, :municipality, :construction, :address, :phone, :token

  with_options presence: true do
    validates :item_id
    validates :user_id
    validates :token
    validates :post, format: { with: /\A\d{3}-\d{4}\z/, message: 'is invalid. Enter it as follows (e.g. 123-4567)' }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :municipality
    validates :address
    validates :phone, format: { with: /\A\d{10,11}\z/, message: 'is invalid. Input only number' }
  end

  def save(params, user_id)
    order = Order.create(item_id: item_id.to_i, user_id: user_id)
    Shipping.create(post: post, prefecture_id: prefecture_id, municipality: municipality, construction: construction,
                    address: address, phone: phone, order_id: order.id)
  end
end

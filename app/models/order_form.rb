class OrderForm
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :post, :prefecture_id, :municipality, :construction, :address, :phone

  with_options presence: true do
    validates :item_id
    validates :user_id
    validates :post, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :municipality
    validates :address
    validates :phone, format: { with: /\A\d{10,11}\z/, message: 'is invalid. Include hyphen(-)' }
  end
  def save(params, user_id)
    order = Order.create(prece: price, item_id: params[:item_id].to_i, user_id: user_id)
    Shipping.create(post: post, prefecture_id: prefecture_id, municipality: municipality, construction: construction,
                    address: address, phone: phone, order_id: order.id)
  end
end

class Item < ApplicationRecord
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  belongs_to :cost_load
  belongs_to :category
  belongs_to :cost
  belongs_to :hidzuke
  belongs_to :user
  has_many :orders

  validates :cost_load_id, :category_id, :cost_id, :prefecture_id, :hidzuke_id,
            numericality: { other_than: 1, message: "can't be blank" }
  validates :item_name, presence: true
  validates :image, presence: true
  validates :item_explanation, presence: true

  with_options presence: true, format: { with: /\A[0-9]+\z/ } do
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },
                      presence: { message: "can't be blank" }
  end
end

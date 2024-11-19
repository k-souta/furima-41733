class Item < ApplicationRecord
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  belongs_to :cost_load
  belongs_to :category

  validates :cost_load_id, :category, numericality: { other_than: 1, message: "can't be blank" }
end

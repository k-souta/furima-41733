class Item < ApplicationRecord
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  belongs_to :cost_load
  belongs_to :category
  belongs_to :cost
  belongs_to :hidzuke

  validates :cost_load_id, :category_id, :cost_id, :hidzuke_id, numericality: { other_than: 1, message: "can't be blank" }
end

class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one_attached :image

  validates :image, :name, :explanation, :price, presence: true
  validates :category_id, :quality_id, :who_pay_id, :delivery_area_id, :delivery_day_id, numericality: { other_than: 1 }
  validates :price, presence: true, numericality: { only_integer: true, message: "can only save half-width numbers." }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
  belongs_to :user
  belongs_to :category
  belongs_to :quality
  belongs_to :who_pay
  belongs_to :delivery_area
  belongs_to :delivery_day


end

class Massage < ApplicationRecord
  belongs_to :category
  has_one_attached :photo

  validates :title, presence: true, allow_blank: false, length: { maximum: 30 }
  validates :subtitle, presence: true, allow_blank: false, length: { maximum: 80 }
  validates :brief_description, presence: true, length: 5..350
  validates :large_description, presence: true, length: 5..1000
  validates :duration, presence: true, numericality: { greater_than_or_equal_to: 0, only_integer: true }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0, allow_float: true }
  validates :photo, presence: true
end

class Home < ApplicationRecord
  has_one_attached :primary_photo
  has_one_attached :secondary_photo

  validates :title, presence: true, allow_blank: true, length: { maximum: 40 }
  validates :description, presence: true, length: 5..700
end

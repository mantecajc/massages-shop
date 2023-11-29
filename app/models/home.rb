class Home < ApplicationRecord
  has_one_attached :primary_photo
  has_one_attached :secondary_photo

  validates :title, presence: true, allow_blank: true
  validates :description, presence: true
end

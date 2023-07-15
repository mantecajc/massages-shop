class Category < ApplicationRecord
  has_many :massages, dependent: :destroy
  has_one_attached :photo

  validates :title, presence: true, allow_blank: false, length: { maximum: 40 }
  PAGES_OPTIONS = ["massages", "offers"]
  validates :page, presence: true, inclusion: { in: PAGES_OPTIONS }
  validates :photo, presence: true
end

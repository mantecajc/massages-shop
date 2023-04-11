class PagesContent < ApplicationRecord
    # TODO: Add rspecs
    has_one_attached :home_primary_photo
    has_one_attached :home_secondary_photo

    validates :home_title, presence: true, allow_blank: true, length: { maximum: 40 }
    validates :home_description, presence: true, length: 5..700
end

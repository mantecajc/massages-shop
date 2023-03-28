class PagesContent < ApplicationRecord
    # TODO: Add rspecs
    validates :home_title, presence: true, allow_blank: true, length: { maximum: 40 }
    validates :home_description, presence: true, length: 5..700
    validates :home_primary_photo, presence: true # TODO: Add validations
    validates :home_secondary_photo, presence: true # TODO: Add validations
end

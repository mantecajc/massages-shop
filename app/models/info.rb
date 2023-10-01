class Info < ApplicationRecord
  validates :content, presence: true, allow_blank: true
end

class Tag < ApplicationRecord
  # belongs_to items
  # belongs_to boxes
  has_many :box_tags
  has_many :item_tags
  searchkick
end

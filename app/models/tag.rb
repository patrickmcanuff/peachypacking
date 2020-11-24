class Tag < ApplicationRecord
  has_many :box_tags
  has_many :item_tags
end

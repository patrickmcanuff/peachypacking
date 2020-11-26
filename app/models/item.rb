class Item < ApplicationRecord
  belongs_to :project
  belongs_to :box, optional: true
  has_many :item_tags, dependent: :destroy
  has_many :tags, through: :item_tags

  searchkick
end

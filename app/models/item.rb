class Item < ApplicationRecord
  belongs_to :project
  belongs_to :box, optional: true
  has_many :item_tags, dependent: :destroy

  searchkick
end

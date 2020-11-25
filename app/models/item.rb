class Item < ApplicationRecord
  belongs_to :project
  belongs_to :box, optional: true
  has_many :tags, through: :item_tags, dependent: :destroy
end

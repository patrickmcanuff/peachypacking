class Item < ApplicationRecord
  belongs_to :project
  belongs_to :box
  has_many :tags, through: :item_tags, dependent: :destroy
end

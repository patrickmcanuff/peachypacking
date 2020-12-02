class Box < ApplicationRecord
  belongs_to :project
  has_many :items
  has_many :box_tags, dependent: :destroy
  has_many :tags, through: :box_tags

  searchkick
end

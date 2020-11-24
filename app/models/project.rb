class Project < ApplicationRecord
  belongs_to :user
  has_many :boxes, dependent: :destroy
  has_many :items, dependent: :destroy
end

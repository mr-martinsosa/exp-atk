class Game < ApplicationRecord
  validates_uniqueness_of :name
  has_many :posts
end

class Post < ApplicationRecord
  belongs_to :user, required: false
  belongs_to :game, required: false

  has_many :comments
end

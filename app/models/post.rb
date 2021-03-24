class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :file
  has_many :likes
  has_many :liked_users, through: :likes, source: :user

  acts_as_taggable_on :tags
end

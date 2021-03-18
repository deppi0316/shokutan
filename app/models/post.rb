class Post < ApplicationRecord

  belongs_to :user
  has_one_attached :file

  acts_as_taggable_on :tags
  
end

class Menu < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :name, presence: true
  validates :price, presence: true
end

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :owner_name, presence: true
  has_one :shop
  has_many :menus
  has_many :posts
  has_many :likes, dependent: :destroy
  has_many :like_posts, through: :likes, source: :post
  def already_liked?(post)
    likes.exists?(post_id: post.id)
  end
end

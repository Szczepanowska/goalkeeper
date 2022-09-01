class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :goals, dependent: :destroy
  has_many :bookmarks
  has_many :likes, dependent: :destroy
  has_one_attached :photo

  def already_liked_goal?(goal)
    Like.where(user: self, goal: goal).exists?
  end
end

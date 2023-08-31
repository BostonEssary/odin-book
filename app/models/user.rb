class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :friendships, :class_name => "Friendship"
  has_many :friends, -> { distinct }, through: :friendships

  has_many :friend_requests, :class_name => "FriendRequest"
  has_many :requestees, -> { distinct }, through: :friend_requests

  has_many :notifications, as: :recipient, dependent: :destroy
  has_many :posts
  has_many :comments

  has_many :likes
  has_many :liked_posts, :through => :likes, :source => :posts
end

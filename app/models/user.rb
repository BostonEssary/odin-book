class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :friendships, :class_name => "Friendship"
  has_many :friends, -> { distinct }, through: :friendships

  has_many :friend_requests, :class_name => "FriendRequest"
  has_many :requestees, -> { distinct }, through: :friend_requests
end

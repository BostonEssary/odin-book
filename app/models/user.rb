class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :friendships, :class_name => "Friendship", dependent: :destroy
  has_many :friends, -> { distinct }, through: :friendships, dependent: :destroy

  has_many :friend_requests, :class_name => "FriendRequest", dependent: :destroy
  has_many :requestees, -> { distinct }, through: :friend_requests, dependent: :destroy

  has_many :notifications, as: :recipient, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  has_many :likes, dependent: :destroy
  has_many :liked_posts, :through => :likes, :source => :posts, dependent: :destroy

  has_one_attached :avatar do |attachable|
    attachable.variant :small_thumb, resize_to_fill: [50, 50]
  end

  def small_thumb
    avatar.attached? ? avatar.variant(:small_thumb) : 'default.jpeg'
  end
end

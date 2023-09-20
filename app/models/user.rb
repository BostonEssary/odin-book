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
    attachable.variant :super_small_thumb, resize_to_fill: [25, 25]
    attachable.variant :small_thumb, resize_to_fill: [50, 50]
    attachable.variant :thumb, resize_to_fill: [100, 100]
    attachable.variant :big_thumb, resize_to_fill: [200, 200]
  end

  def find_request(first_user, second_user)
    FriendRequest.where(user_id: first_user.id, requestee_id: second_user.id).first.id
  end

  def super_small_thumb
    avatar.attached? ? avatar.variant(:super_small_thumb) : 'default.jpeg'
  end

  def small_thumb
    avatar.attached? ? avatar.variant(:small_thumb) : 'default.jpeg'
  end

  def thumb
    avatar.attached? ? avatar.variant(:thumb) : "default.jpeg"
  end

  def big_thumb
    avatar.attached? ? avatar.variant(:big_thumb): "default.jpeg"
  end
end

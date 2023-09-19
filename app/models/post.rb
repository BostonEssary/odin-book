class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  has_many :likes, dependent: :destroy
  has_many :liking_users, :through => :likes, :source => :user

  validates :body, presence: true

  has_one_attached :photo

  def date_format
    created_at.strftime("%B %e, %Y @ %l:%M %P")
  end

  def liked_by? user
    likes.where(user: user).exists?
  end
end

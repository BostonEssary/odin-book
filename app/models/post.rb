class Post < ApplicationRecord
  belongs_to :user
  has_many :comments

  has_many :likes
  has_many :liking_users, :through => :likes, :source => :user


  def date_format
    created_at.strftime("%B %e, %Y @ %l:%M %P")
  end

  def liked_by? user
    likes.where(user: user).exists?
  end
end

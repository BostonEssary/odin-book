class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  has_many :likes, as: :likeable
  has_noticed_notifications


  def date_format
    created_at.strftime("%B %e, %Y @ %l:%M %P")
  end
end

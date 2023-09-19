class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  
  validates :content, presence: true

  has_noticed_notifications


  def date_format
    created_at.strftime("%B %e, %Y @ %l:%M %P")
  end
end

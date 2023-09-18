class Notification < ApplicationRecord
  include Noticed::Model
  belongs_to :recipient, polymorphic: true

  after_create_commit :broadcast_to_recipient

  
  def broadcast_to_recipient
    user = recipient
    broadcast_replace_later_to(
      recipient,
      :notifications,
      target: 'notifications-size',
      partial: 'layouts/notifications',
      locals: {
        unread_notifications: user.notifications.unread.size
      }
    )
  end
  
end

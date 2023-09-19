class Notification < ApplicationRecord
  include Noticed::Model
  belongs_to :recipient, polymorphic: true

  after_create_commit :broadcast_to_recipient



  def formatted_date
    created_at.strftime("%_m/%e/%Y @ %l:%M %P")
  end

  def broadcast_to_recipient
    broadcast_append_later_to(
      recipient,
      :notifications,
      target: 'notifications-list',
      partial: 'notifications/notification',
      locals: {
        notification: self
      }
    )
  end
end
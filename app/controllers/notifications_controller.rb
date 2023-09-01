class NotificationsController < ApplicationController

    def index
        @notifications = current_user.notifications.unread
        
    end

    def show
        @notification = Notification.find(params[:id])
        @notification.mark_as_read!
    end
end

# To deliver this notification:
#
# FriendRequestNotification.with(post: @post).deliver_later(current_user)
# FriendRequestNotification.with(post: @post).deliver(current_user)

class FriendRequestNotification < Noticed::Base
  # Add your delivery methods
  #
  deliver_by :database
  # deliver_by :email, mailer: "UserMailer"
  # deliver_by :slack
  # deliver_by :custom, class: "MyDeliveryMethod"

  # Add required params
  #
  param :friend_request

  # Define helper methods to make rendering easier.
  #
  def message
     "You have a new friend request."
  end
  #
  def url
    profile_friend_requests_path(params[:friend_request])
  end
end

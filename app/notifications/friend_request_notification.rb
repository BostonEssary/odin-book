# To deliver this notification:
#
# FriendRequestNotification.with(post: @post).deliver_later(current_user)
# FriendRequestNotification.with(post: @post).deliver(current_user)

class FriendRequestNotification < Noticed::Base
  
  deliver_by :database
 
  param :friend_request

  
  def message
     "You have a new friend request from #{creator.name}"
  end

  def location
  end

  def creator
    params[:friend_request].user
  end

  def creator_id
    params[:friend_request].user.id
  end
  
  def url
    profile_friend_requests_path(params[:friend_request])
  end
end

# To deliver this notification:
#
# LikeNotification.with(post: @post).deliver_later(current_user)
# LikeNotification.with(post: @post).deliver(current_user)

class LikeNotification < Noticed::Base
  # Add your delivery methods
  #
  deliver_by :database
  # deliver_by :email, mailer: "UserMailer"
  # deliver_by :slack
  # deliver_by :custom, class: "MyDeliveryMethod"

  # Add required params
  #
  param :like
  param :post

  # Define helper methods to make rendering easier.
  #
  def creator
    
    params[:like].user
  end 

  def location
    params[:like].post
  end

  def creator_avatar
    params[:like].user.small_thumb
  end 

  def message
    "#{creator.name} liked your post"
  end

 
end

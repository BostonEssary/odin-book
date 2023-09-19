# To deliver this notification:
#
# CommentNotification.with(post: @post).deliver_later(current_user)
# CommentNotification.with(post: @post).deliver(current_user)

class CommentNotification < Noticed::Base
  # Add your delivery methods
  #
  deliver_by :database
  # deliver_by :email, mailer: "UserMailer"
  # deliver_by :slack
  # deliver_by :custom, class: "MyDeliveryMethod"

  # Add required params
  #
  param :comment
  param :post

  def creator
    
    params[:comment].user
  end 

  def location
    params[:comment].post
  end

  def creator_avatar
    params[:comment].user.small_thumb
  end 

  def message
    "#{creator.name} commented on your post"
  end

end

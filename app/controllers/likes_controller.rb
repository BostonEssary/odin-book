class LikesController < ApplicationController
  def create
    @like = post.likes.create(user: current_user)
  
    notification = LikeNotification.with(like: @like, post: post)
    notification.deliver(post.user)

    render turbo_stream: turbo_stream.replace(
      helpers.dom_id(post, :like),
      partial: "posts/likes",
      locals: {post: post}
    )
  end

  def destroy 
    post.likes.where(user: current_user).destroy_all

    render :likes
  end

  private

  def post
    @post ||= Post.find(params[:post_id])
  end

end

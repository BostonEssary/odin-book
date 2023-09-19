class CommentsController < ApplicationController
  def create
    @comment = post.comments.new(comment_params)
    @comment.user = current_user

    if @comment.valid?
      @comment.save
      notification = CommentNotification.with(comment: @comment, post: post)
      notification.deliver(post.user)
    else
      flash[:comment_error] = "Could not post"
      redirect_to post_path(post)
    end

    
    
    respond_to do |format|
      format.turbo_stream 
    end
  end

  def new
    @comment = post.comments.new
  end

  private
  def post
    @post ||= Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end

class CommentsController < ApplicationController
  def create
    @comment = post.comments.new(comment_params)
    @comment.user = current_user
    @comment.save
    
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

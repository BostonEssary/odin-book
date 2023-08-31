class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)
    @comment.post = @post
    @comment.user = current_user

    if @comment.save
      redirect_to @post
    end
  end

  def new
    @comment = Comment.new()
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end

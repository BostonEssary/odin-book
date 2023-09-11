class PostsController < ApplicationController
  def index
    ids = current_user.friends.pluck(:id) << current_user.id
    @posts = Post.where(user_id: ids)
    @comment = Comment.new()
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    @post.save

    respond_to do |format|
      format.turbo_stream
    end
  end

  def new
    @post = Post.new()
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy!
  end


  def show
    @post = Post.find(params[:id])
  end

  private
  
  def post_params
    params.require(:post).permit(:body)
  end

end

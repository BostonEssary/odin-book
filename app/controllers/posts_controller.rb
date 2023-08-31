class PostsController < ApplicationController
  def index
    @posts = Post.all()
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user

    if @post.save
      redirect_to posts_path
    end
  end

  def new
    @post = Post.new()
  end


  def show
    @post = Post.find(params[:id])
    @comment = Comment.new()
    @like = Like.new()
  end

  private
  
  def post_params
    params.require(:post).permit(:body)
  end

end

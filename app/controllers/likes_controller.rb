class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @like = Like.new()
    @like.post = @post
    @like.user = current_user

    if @like.save
      redirect_to root_path
    end
    
    
  end

  def new
    @like = Like.new()
  end

  def destroy 
    @like = params[:id]

    Like.destroy(@like)
  end

end

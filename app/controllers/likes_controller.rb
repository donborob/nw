class LikesController < ApplicationController
  respond_to :html
  def create
    @like = current_user.likes.create(like_params)
    render  posts_path
  end

  def destroy
    like = current_user.likes.find(params[:id]).destroy
    @post = Post.find(id = like.post_id)
     render  posts_path
  end

  def like_params
    params.require(:like).permit(:post_id, :user_id)
  end
end

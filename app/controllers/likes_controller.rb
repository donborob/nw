class LikesController < ApplicationController
  def create
    respond_to do |format|
    @like = current_user.like.create(like_params)
    format.js {  render :toggle }
      end
  end

  def destroy
    like = Like.find(like_params).destroy
    @post = Post.find(id = like.post_id)
    render :toggle
  end

  def like_params
    params.require(:like).permit(:post_id, :user_id)
  end
end

class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @comments = Comment.all
    respond_with(@comments)
  end

  def show
    respond_with(@comment)
  end

  def new
    @comment = Comment.new
    respond_with(@comment)
  end

  def edit
  end

  def create
    @post = Post.find(id = params[:post_id])
    @comment = @post.comments.new(comment_params)
    respond_to do |format|
      if @comment.save
        format.html { redirect_to Post.find(id = params[:post_id])}
      end
    end
  end

  def update
    @comment.update(comment_params)
    respond_with(@comment)
  end

  def destroy
    @comment.destroy
    respond_with(@comment)
  end

  private
  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params[:comment][:post_id] = params[:post_id]
    @post = Post.find(id = params[:post_id] )
    params.require(:comment).permit(:content,:post_id,:user_id)

  end
end
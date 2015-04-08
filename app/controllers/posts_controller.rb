class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy,]

  def user_posts
    set_user
    @authors = Hash.new
    @posts = Post.where(user_id: @user.id)
    @posts.each do |post|
      if (post.user_id!= nil)
        @user = User.find(id = post.user_id)
        @authors[post.id]= @user.name
      end
    end
  end

  def index
    @authors = Hash.new
    @posts = Post.all
    @posts.each do |post|
      if (post.user_id!= nil)
        @user = User.find(id = post.user_id)
        @authors[post.id]= @user.name
      end
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @comments = @post.comments.all
    @comment = @post.comments.new
    @authors = Hash.new
    @posts = Post.all
    @posts.each do |post|
      if (post.user_id!= nil)
        @user = User.find(id = post.user_id)
        @authors[post.id]= @user.name
      end
    end
    @authors1 = Hash.new
    @comments = @post.comments.all
    @comments.each do |comment|
      if (comment.post_id!= nil && comment.user_id!= nil)
        @user = User.find(id=comment.user_id)
        @authors1[comment.id]= @user.name
      end
    end
    end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def add_comment
    @comment = Comment.new(comment_params)
    respond_to do |format|
      if @comment.save
        format.html { redirect_to post_path(@post) }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  end

  def set_user
    @user = User.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def post_params
    params[:post][:user_id] = current_user.id
    params.require(:post).permit(:title, :content, :user_id)
  end

  def comment_params
    set_post
    param[:comment][:post_id] = @post.id
    params.require(:comment).permit(:user_name, :content)
  end

end

class UserController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update]
  respond_to :html

  def show
  end

  def edit
    @user = current_user
  end

  def update
    @user=current_user
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_path}
      end
    end
  end

  def index
    @users = User.all
    @conversation = Conversation.new
    respond_to do |format|
	format.html {}
	format.json {render json: @users}
    end
  end

  def user_params
    params.require(:user).permit(:avatar,:firstname,:lastname,:gender,:birthday,:extra);
  end
  def set_user
    @user = User.find(params[:id])
  end
end

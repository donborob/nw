class ConversationsController < ApplicationController
  before_action :set_conversation, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
  end

  def show
    @messages = @conversation.messages.all
    @message = @conversation.messages.new
  end

  def new
    @conversation
  end

  def edit
  end

  def create
    @conversation = current_user.conversations.new(conversation_params)
    @conversation.save
    user = User.find(id =  params[:conversation][:partner_id])
    params[:conversation][:partner_id], params[:conversation][:user_id]=
        params[:conversation][:user_id],params[:conversation][:partner_id]
    conversation = user.conversations.new(conversation_params)
    conversation.save
    redirect_to(user_conversation_path(current_user, @conversation))
  end

  def destroy
    @conversation.destroy
    respond_with(@conversation)
  end

  private
    def set_conversation
      @conversation = Conversation.find(params[:id])
    end

    def conversation_params
      params.require(:conversation).permit(:user_id, :partner_id)
    end
end

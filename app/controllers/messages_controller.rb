class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
 # @conversation = Conversation.find(params[:id])
   # @messages = @conversation.message
    respond_with(@messages)
  end

  def show
    respond_with(@message)
  end

  def new
    @message = Message.new
    respond_with(@message)
  end

  def edit
  end

  def create
    @conversation = Conversation.find(params[:conversation_id])
    @message = @conversation.messages.new(message_params)
    @message.save
    conversation = Conversation.where("user_id = ? and partner_id = ?",params[:message][:receiver_id],
                                      params[:message][:sender_id]).first
    params[:conversation_id] = conversation.id
    params[:message][:conversation_id]  = conversation.id
    message = conversation.messages.new(message_params)
    message.save
    redirect_to(user_conversation_path(current_user, @message.conversation))
  end

  def update
    @message.update(message_params)
    respond_with(@message)
  end

  def destroy
    @message.destroy
    respond_with(@message)
  end

  private
    def set_message
      @message = Message.find(params[:id])
    end

    def message_params
      params.require(:message).permit(:content, :conversation_id, :sender_id, :receiver_id)
    end
end

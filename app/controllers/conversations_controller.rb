class ConversationsController < ApplicationController
  before_action :set_conversation, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
   # @first = current_user
    #@second = User.find(params[:id])
   # @conversations = Conversation.find(first_id = current_user.id or second_id = current_user.id)
   # respond_with(@conversations)
  end

  def show
    #@first = current_user
  #  @second = User.find(params[:id])
   # @conversation = Conversation.find((first_id = @first.id and second_id =@second.id ) or
                                           (first_id = @second.id and second_id = @first.id ))
    #respond_with(@conversations)
  end

  def new
    @conversation = Conversation.new
    respond_with(@conversation)
  end

  def edit
  end

  def create
    @conversation = Conversation.new(conversation_params)
    @conversation.save
    respond_with(@conversation)
  end

  def update
    @conversation.update(conversation_params)
    respond_with(@conversation)
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
      params.require(:conversation).permit(:first_id, :second_id)
    end
end

class MessagesController < ApplicationController

  def index
    @conversations = current_user.mailbox.inbox
    @num_messages = @conversations.count
  end

  def new
    @sender = User.find(params[:sender])
    @receiver = User.find(params[:receiver])
    @subject = params[:subject]
  end

  def create
    receiver = User.find(params[:receiver])
    current_user.send_message(receiver, params[:body], params[:subject])
    redirect_to profile_path, flash: { notice: "Message Sent" }
  end
end
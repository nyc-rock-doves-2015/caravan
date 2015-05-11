class MessagesController < ApplicationController

  def index
    @conversations = current_user.mailbox.inbox
    @num_messages = @conversations.count
  end
end
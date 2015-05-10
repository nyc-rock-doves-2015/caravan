class MessagesController < ApplicationController

  def inbox
    @conversations = current_user.mailbox.inbox
    @num_messages = @conversations.count
  end
end
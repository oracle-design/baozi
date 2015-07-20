class ChatController < WebsocketRails::BaseController
  def initialize_session
    # perform application setup here
    controller_store[:message_count] = 0
  end

  def new_message
    user_msg :new_message, message[:msg_body].dup
  end

  def client_connected
    puts '-'*40
  end

  def client_disconnected
    puts '&'*40
  end

  def user_msg(ev, msg)
    broadcast_message :new_message, { msg_body: "you say : server return" }
    # send_message :new_message, {:message => 'Welcome to the Chat Room!'}
  end
end
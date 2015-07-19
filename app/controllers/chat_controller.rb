class ChatController < WebsocketRails::BaseController
  def initialize_session
    # perform application setup here
    controller_store[:message_count] = 0
  end

  def new_message
    user_msg :new_message, message[:msg_body].dup
    puts ')'*40

  end

  def client_connected
    puts '-'*40
  end

  def client_disconnected
    puts '&'*40
  end

  def user_msg(ev, msg)
    broadcast_message ev, { 
      # user_name:  connection_store[:user][:user_name], 
      received:   Time.now.to_s(:short), 
      msg_body:   ERB::Util.html_escape(msg) 
      }
  end
end
class ChatController < WebsocketRails::BaseController
  def initialize_session
    # perform application setup here
    controller_store[:message_count] = 0
  end

  def new_message
    puts ')'*40
  end

  def client_connected
    puts '-'*40
  end

  def client_disconnected
    puts '&'*40
  end
end
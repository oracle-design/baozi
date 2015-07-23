class ChatController < WebsocketRails::BaseController
  def initialize_session
    # perform application setup here
    controller_store[:message_count] = 0
  end

  def new_message
    user_msg :new_message, message.dup
  end

  def client_connected
    puts '-'*40
  end

  def client_disconnected
    puts '&'*40
  end

  def user_msg(ev, msg)
    sender_id = msg[:sender_id]
    msg_body = msg[:msg_body]
    # broadcast_message :new_message, { msg_body: "Server return : #{msg_body}" }
    send_to = msg[:send_to].to_i
    WebsocketRails.users[send_to].send_message('new_message', { sender_id: "#{sender_id}" msg_body: "Server return : #{msg_body}" })
  end

  def new_user
    # WebsocketRails.users[data] = data
    connection_store[data] = { user_name: data}
  end

end
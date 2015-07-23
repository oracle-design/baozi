class ChatController < WebsocketRails::BaseController
  include ActionView::Helpers::SanitizeHelper

  def initialize_session
    puts "Session Initialized\n"
  end
  
  def system_msg(ev, msg)
    broadcast_message ev, { 
      user_name: 'system', 
      received: Time.now.to_s(:short), 
      msg_body: msg
    }
  end
  
  def user_msg(ev, msg)
    # broadcast_message ev, { 
    #   user_name:  connection_store[:user][:user_name], 
    #   received:   Time.now.to_s(:short), 
    #   msg_body:   ERB::Util.html_escape(msg) 
    #   }
    sender_id = msg[:sender_id]
    msg_body = msg[:msg_body]
    # broadcast_message :new_message, { msg_body: "Server return : #{msg_body}" }
    receiver_id = msg[:receiver_id].to_i
    WebsocketRails.users[receiver_id].send_message('new_message', { 
      user_name: "vincet",
      sender_id: "#{sender_id}", 
      msg_body: "Server return : #{msg_body}",
      received:   Time.now.to_s(:short)
     })
  end
  
  def client_connected
    system_msg :new_message, "client #{client_id} connected"
  end
  
  def new_message
    user_msg :new_message, message
  end
  
  def new_user
    connection_store[:user] = { user_name: sanitize(message[:user_name]) }
    broadcast_user_list
  end
  
  def change_username
    connection_store[:user][:user_name] = sanitize(message[:user_name])
    broadcast_user_list
  end
  
  def delete_user
    connection_store[:user] = nil
    system_msg "client #{client_id} disconnected"
    broadcast_user_list
  end
  
  def broadcast_user_list
    users = connection_store.collect_all(:user)
    broadcast_message :user_list, users
  end


  
end
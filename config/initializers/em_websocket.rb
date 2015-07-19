require 'em-websocket'



Thread.new {
  EventMachine.run {
    EventMachine::WebSocket.start(:host => "127.0.0.1", :port => 8080) do |ws|
      ws.onopen {
        puts "WebSocket connection open"
      }

      ws.onmessage { |msg|
        puts "Recived message: #{msg}"
        ws.send(msg)
      }

      ws.onclose {
        puts "WebSocket connection closed"
      }
    end
  }
}



# class EchoServer
#    def post_init
#      puts "-- someone connected to the echo server!"
#    end

#    def receive_data data
#      send_data ">>>you sent: #{data}"
#      close_connection if data =~ /quit/i
#    end

#    def unbind
#      puts "-- someone disconnected from the echo server!"
#    end
# end

# # Note that this will block current thread.
# Thread.new{
# EventMachine.run {
#   EventMachine.start_server "127.0.0.1", 9001, EchoServer
# }
# }
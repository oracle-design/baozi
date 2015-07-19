require 'em-websocket'
require 'eventmachine'

class Say < EventMachine::Connection
	def post_init
		send_data ">>Ready ~~~\n"
	end
end

EventMachine.run {
	EventMachine.start_server '127.0.0.1', 8081, Say
	puts "Running on the port 8081"
}

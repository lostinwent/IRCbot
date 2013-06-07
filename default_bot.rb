require "Socket"

#TCP socket : send data/command to the server

server      = "irc.rizon.net"
port 	 			= "6667"
nick   			= "Ruby IRC Bot"
channel			= "#0x40"

s = TCPSocket.open(server, port)

s.puts "USER tesing 0 * Testing"
s.puts "NICK #{nick}"
s.puts "JOIN #{channel}"
s.puts "PRIVMSG #{channel} :Hello from IRB Bot"

until s.eof? do |variable|
	msg = s.gets
	puts msg
end
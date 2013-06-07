require "socket"

server = "chat.freenode.net"
port = "6667"
nick = "FXBOT"
channel = "#bitmaker"
greeting_prefix = "PRIVMSG #bitmaker :" #response to this only server

#for instruments
file = File.open("/users/SW/BitMaker Assignments/W1D5/instruments.txt", "r")
instruments = file.read.split

# opens new socketwith the correct port and server
s = TCPSocket.open(server, port)

# print("addr: ", s.addr.join(":"), "\n")
# print("peer: ", s.peeraddr.join(":"), "\n")

s.puts "USER FXBOT 0 * FXBOT"
s.puts "NICK #{nick}"
s.puts "JOIN #{channel}"
s.puts "PRIVMSG #{channel} :Which two currencies live info you want to know?"

until s.eof? do
  msg = s.gets
  puts msg

  wasGreeted = false
  greetings.each do |g|
  	wasGreeted = true if msg.include? g
  end

  if msg.include? greeting_prefix and wasGreeted
  	response = "yoyoyoyoyo!"
  	s.puts "PRIVMSG #{channel} : #{response}"
  end
end

# as a person
# set up Nickname -> /NICK [USERNAME]
# join -> /JOIN #bitmaker

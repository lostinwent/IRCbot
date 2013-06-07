require "socket"

server = "chat.freenode.net"
port = "6667"
nick = "YOYOBOT"
channel = "#bitmaker"
greeting_prefix = "PRIVMSG #bitmaker :" #response to this only server
greetings = ["hello", "hi", "yo", "wazup"]


# opens new socketwith the correct port and server
s = TCPSocket.open(server, port)

# print("addr: ", s.addr.join(":"), "\n")
# print("peer: ", s.peeraddr.join(":"), "\n")

s.puts "USER YOYOBOT 0 * YOYOBOT"
s.puts "NICK #{nick}"
s.puts "JOIN #{channel}"
s.puts "PRIVMSG #{channel} :yOyOyOyO"

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

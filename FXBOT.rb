require 'socket'
require 'Nokogiri'
require 'open-uri'

server = "chat.freenode.net"
port = "6667"
nick = "FXBOT"
channel = "#bitmaker"
greeting_prefix = "PRIVMSG #bitmaker :"

file = File.open("/users/SW/BitMaker Assignments/W1D5/instruments.txt", "r")
instruments = file.read.split

s = TCPSocket.open(server, port)

s.puts "USER FXBOT 0 * FXBOT"
s.puts "NICK #{nick}"
s.puts "JOIN #{channel}"
s.puts "PRIVMSG #{channel} :I know all currencies and metal prices in real time! Ask me"

until s.eof? do
  msg = s.gets
  puts msg

  wasAsking = false
  instruments.each do |i|
  wasAsking = true if msg.include? i
  end

  if msg.include? greeting_prefix and wasAsking
  	currencies_u = msg.split(//).last(9).join.to_s
  	currencies_c = currencies_u[0,7]
  	msg_convert = currencies_c.sub(/\//, '_')
  	instrument = Nokogiri::HTML(open("http://api-sandbox.oanda.com/v1/instruments/#{msg_convert}/price")).at_css("//p").text.strip
		n = instrument.length
		first_number = instrument[n-22..n-16]
		last_number  = instrument[n-8..n-2]

response = "The live rate for #{currencies_c}: Buy:#{first_number}, Sell:#{last_number}. Wanna buy or sell?"
  	s.puts "PRIVMSG #{channel} : #{response}"
  end
end
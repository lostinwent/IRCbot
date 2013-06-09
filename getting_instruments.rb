require 'Nokogiri'
require 'open-uri'

# doc = Nokogiri::HTML(open("http://api-sandbox.oanda.com/v1/instruments/EUR_CAD/price"))
instruments = Nokogiri::HTML(open("http://api-sandbox.oanda.com/v1/instruments/EUR_CAD/price")).at_css("//p").text.strip

# @doc.at_css("//p")

# instruments = doc.at_css("p")

n = instruments.length
last_number  =  instruments[n-8..n-2]
first_number = instruments[n-22..n-16]

puts last_number
puts first_number


# b = instruments.to_s.split(',')
# puts b.to_s["instrument"]
# c = b.to_s.split('"')

# puts d
# puts c[4]

# z = []
# z << b

# puts z[0]
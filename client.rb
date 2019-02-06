require 'savon'

client = Savon::Client.new(wsdl: "http://localhost:3000/plan/wsdl")
result = client.call(:planes)
puts result.to_hash
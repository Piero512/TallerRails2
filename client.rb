require 'savon'

client = Savon::Client.new(wsdl: "http://localhost:3010/plan/wsdl")
result = client.call(:planes)
puts result.to_hash
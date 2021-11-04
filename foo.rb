require 'net/http'
require 'json'

# response = JSON(Net::HTTP.get(URI('https://api.chucknorris.io/jokes/random')).body)&.transform_keys(&:to_sym)
response = JSON(Net::HTTP.get(URI('https://api.chucknorris.io/jokes/random'))).transform_keys(&:to_sym)

p response
p response[:value]

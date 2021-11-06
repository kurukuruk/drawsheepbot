# frozen_string_literal: true

require 'net/http'
require 'json'

module Drawsheep
  module Norris
    module Service
      def self.call
        url = 'https://api.chucknorris.io/jokes/random'
        uri = URI(url)
        response = JSON(Net::HTTP.get(uri)).transform_keys(&:to_sym)
        if response[:value]
          response[:value]
        elsif response[:error]
          "#{response[:error]} : #{response[:message]}"
        end
      end
    end
  end
end

# frozen_string_literal: true

require 'net/http'
##
# La commande de Chuck Norris.
#
module Drawsheep
  module Commands
    class ChuckNorris < SlackRubyBot::Commands::Base
      operator '-norris'
      command 'norris'

      help do
        title 'norris'
        desc 'Chuck Norris'
        long_desc 'get a Chuck Norris fact.'
      end

      def self.response
        response = JSON(Net::HTTP.get(URI('https://api.chucknorris.io/jokes/random'))).transform_keys(&:to_sym)
        if response[:value]
          response[:value]
        elsif response[:error]
          "#{response[:error]} : #{response[:message]}"
        end
      end

      def self.call(client, data, _match)
        client.say(channel: data.channel, text: response)
      rescue StandardError => e
        client.say(channel: data.channel, text: "Je rencontre un problème: #{e.message}.")
      end
    end
  end
end

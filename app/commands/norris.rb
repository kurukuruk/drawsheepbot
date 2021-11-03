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

      def self.call(client, data, _match)
        response = Net::HTTP.get_response('https://api.chucknorris.io', '/jokes/random')
        client.say(channel: data.channel, text: response.body)
      rescue StandardError => e
        client.say(channel: data.channel, text: "Je rencontre un problème: #{e.message}.")
      end
    end
  end
end

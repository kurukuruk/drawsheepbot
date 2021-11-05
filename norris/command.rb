# frozen_string_literal: true

##
# La commande de Chuck Norris.
#
module Drawsheep
  module Norris
    class Command < ::SlackRubyBot::Commands::Base
      operator '-norris'
      command 'norris'

      help do
        title 'norris'
        desc 'Chuck Norris'
        long_desc 'get a Chuck Norris fact.'
      end

      def self.call(client, data, _match)
        client.say(channel: data.channel, text: get('/norris'))
      rescue StandardError => e
        client.say(channel: data.channel, text: "Je rencontre un problème: #{e.message}.")
      end
    end
  end
end

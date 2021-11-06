# frozen_string_literal: true

##
# La commande de Chuck Norris.
# Permet d'appeler l'api des blagues sur Chuck Norris
# A charger avant l'appelle du robot, la classe mère gère ses commandes
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

      def self.call(client, data, match)
        client.say(channel: data.channel, text: get('/norris'))
        super client, data, match
      end
    end
  end
end

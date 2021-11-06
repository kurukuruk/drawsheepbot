# frozen_string_literal: true

module Drawsheep
  module Calcule
    class Commands < ::SlackRubyBot::Commands::Base
      operator '='
      command 'calcule'

      help do
        title 'calcule'
        desc 'Opératiion mathématique (operateur: = )'
        long_desc 'Je Retourne le résultat d\'une opération mathématique.'
      end

      def self.call(client, data, match)
        operation = Service.parse_for_uri match[:expression]
        client.say(channel: data.channel, text: get("/calcule/#{operation}"))
        super client, data, match
      end
    end
  end
end

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
        super client, data, match do
          # operation = Service.parse_for_uri(match[:expression])
          operation = match[:expression].strip
          client.say(channel: data.channel, text: post('/calcule', operation: operation))
        end
      end
    end
  end
end

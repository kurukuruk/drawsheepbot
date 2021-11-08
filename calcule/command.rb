# frozen_string_literal: true

module Drawsheep
  module Calcule
    class Commands < Kernel::Command
      operator '='
      command 'calcule'

      help do
        title 'calcule'
        desc 'Opératiion mathématique (operateur: = )'
        long_desc 'Je Retourne le résultat d\'une opération mathématique.'
      end

      def self.call(client, data, match)
        super client, data, match do
          client.say(channel: data.channel, text: post('/calcule', operation: match[:expression]))
        end
      end
    end
  end
end

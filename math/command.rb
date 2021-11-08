# frozen_string_literal: true

module Drawsheep
  module Math
    class Commands < Kernel::Command
      operator '='
      command 'math'

      help do
        title 'math'
        desc 'Opératiion mathématique (operateur: = )'
        long_desc 'Je Retourne le résultat d\'une opération mathématique.'
      end

      def self.call(client, data, match)
        super client, data, match do
          client.say(channel: data.channel, text: post('/math', operation: match[:expression]))
        end
      end
    end
  end
end

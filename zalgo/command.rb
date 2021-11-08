# frozen_string_literal: true

module Drawsheep
  module Zalgo
    class Commands < Kernel::Command
      operator '-creep'
      command 'zalgo'

      help do
        title 'zalgo'
        desc 'Invoquer le sentiment de chaos. (operateur: -creep'
        long_desc 'Convertit une chaine de charactère en chaine détruite par Zalgo.'
      end

      def self.call(client, data, match)
        super client, data, match do
          client.say(channel: data.channel, text: post('/zalgo', string: match['expression']))
        end
      end
    end
  end
end

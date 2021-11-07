# frozen_string_literal: true

module Drawsheep
  module Zalgo
    class Commands < SlackRubyBot::Commands::Base
      operator '-creep'
      command 'zalgo'

      help do
        title 'zalgo'
        desc 'Invoquer le sentiment de chaos. (operateur: -creep'
        long_desc 'Convertit une chaine de charactère en chaine détruite par Zalgo.'
      end

      def self.call(client, data, match)
        super client, data, match do
          text = match['expression'].strip
          client.say(channel: data.channel, text: post('/zalgo', text: text))
        end
      end
    end
  end
end

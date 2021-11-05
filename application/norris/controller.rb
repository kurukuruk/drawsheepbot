# frozen_string_literal: true

##
# La commande youtube permet de faire une recherche sur youutube, ou d'avoir juste youtube.
#
module Drawsheep
  module Commands
    class Zalgo < SlackRubyBot::Commands::Base
      operator '-zalgo'
      command 'zalgo'

      help do
        title 'zalgo'
        desc 'Invoquer le sentiment de chaos.'
        long_desc 'Ce générateur de texte Zalgo convertis les textes normaux en textes glitchés et déformés en utilisant les charactères de combinaison.'
      end

      def self.call(client, data, match)
        if match['expression'] && !match['expression'].empty?
          client.say(channel: data.channel, text: match['expression'].to_zalgo)
        else
          client.say(channel: data.channel, text: 'Rien à détruire...')
        end
      rescue StandardError => e
        client.say(channel: data.channel, text: "Je rencontre un problème: #{e.message}.")
      end
    end
  end
end

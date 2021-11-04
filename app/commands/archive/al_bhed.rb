# frozen_string_literal: true

require './lib/string'

##
# La commande al_bhed.
# Transforme du texte alphabet en texte al_bhed (voir: final fantasy X)
#
module Drawsheep
  module Commands
    class AlBhed < SlackRubyBot::Commands::Base
      operator '-al_bhed'
      command 'al_bhed'

      help do
        title 'al_bhed'
        desc 'Votre texte en Al Bhed'
        long_desc 'Transforme votre texte alphabétique en texte Al Bhed (voir: Final Fantasy X)'
      end

      def self.call(client, data, match)
        result = match[:expression].to_s.to_al_bhed

        if result && !result.empty?
          client.say(channel: data.channel, text: result)
        else
          client.say(channel: data.channel, text: 'Aucun résultat possible.')
        end
      rescue StandardError => e
        client.say(channel: data.channel, text: "Je rencontre un problème: #{e.message}.")
      end
    end
  end
end

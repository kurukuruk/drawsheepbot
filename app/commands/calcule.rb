# frozen_string_literal: true

require 'Dentaku'

##
# La commande des calcules mathématiques.
#
module Drawsheep
  module Commands
    class Calcule < SlackRubyBot::Commands::Base
      operator '='
      command 'calcule'

      help do
        title 'calcule'
        desc 'On fait des maths? (alias: "= *args")'
        long_desc 'Retourne le résultat d\'une opération mathématique.'
      end

      def self.call(client, data, match)
        result = Dentaku::Calculator.new.evaluate(match[:expression]).to_s
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

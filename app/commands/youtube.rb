# frozen_string_literal: true

##
# La commande youtube permet de faire une recherche sur youutube, ou d'avoir juste youtube.
#
module Drawsheep
  module Commands
    class Youtube < SlackRubyBot::Commands::Base
      operator '-youtube'
      command 'youtube'

      help do
        title 'youtube'
        desc 'Envie de vidéos? (alias: "-youtube *args")'
        long_desc 'Je parse les arguments puis je vous envoie un lien youtube.'
      end

      def self.call(client, data, match)
        if match[:expression]
          client.say(channel: data.channel, text: get("/youtube/#{match[:expression].strip.gsub(' ', '+')}"))
        else
          client.say(channel: data.channel, text: get('/youtube'))
        end
      rescue StandardError => e
        client.say(channel: data.channel, text: "Je rencontre un problème: #{e.message}.")
      end
    end
  end
end

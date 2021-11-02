# frozen_string_literal: true

##
# La commande des calcules mathématiques.
#
module Drawsheep
  module Commands
    class Ping < SlackRubyBot::Commands::Base
      operator '-ping'
      command 'ping'

      help do
        title 'ping'
        desc 'ping pong dialogue.'
        long_desc 'Une partie de ping pong ?'
      end

      def self.call(client, data, _match)
        client.say(text: 'pong', channel: data.channel)
      rescue StandardError => e
        client.say(channel: data.channel, text: "Je rencontre un problème: #{e.message}.")
      end
    end
  end
end

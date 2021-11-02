##
# La commande des youtube.
#
module Drawsheep
  module Commands
    class MathCommand < SlackRubyBot::Commands::Base
      operator '-youtube'
      command 'youtube'

      help do
        title 'youtube'
        desc 'Opérateur "-youtube *args"'
        long_desc 'Je parse les arguments puis je vous envoie un lien youtube.'
      end

      def self.call(client, data, match)
        url = 'https://www.youtube.com'
        search_query = match['expression'].strip.gsub(' ', '+') if match['expression']
        if search_query && !search_query.empty?
          client.say(channel: data.channel, text: "#{url}/results?search_query=#{search_query}")
        else
          client.say(channel: data.channel, text: url)
        end
      rescue StandardError => e
        client.say(channel: data.channel, text: "Je rencontre un problème: #{e.message}.")
      end
    end
  end
end

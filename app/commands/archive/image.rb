# frozen_string_literal: true

# img = 'https://pbs.twimg.com/profile_images/775422538264539137/qoggaogm.jpg'

# require 'open-uri'

# File.open('pie.png', 'wb') do |fo|
#   fo.write open(img).read
# end

##
# La commande de Chuck Norris.
#
module Drawsheep
  module Commands
    class HTMLBoilerplate < SlackRubyBot::Commands::Base
      operator '-img'
      command 'image'

      help do
        title 'image'
        desc 'image'
        long_desc 'image'
      end

      def self.call(client, data, match)
        client.say(channel: data.channel, text: 'ok ' + match[:expression].to_s)
      rescue StandardError => e
        client.say(channel: data.channel, text: "Je rencontre un problème: #{e.message}.")
      end
    end
  end
end

# frozen_string_literal: true

require 'erb'

##
# La commande de Chuck Norris.
#
module Drawsheep
  module Commands
    class HTMLBoilerplate < SlackRubyBot::Commands::Base
      operator '-html'
      command 'html boilerplate'

      help do
        title 'html boilerplate'
        desc 'A Basic HTML5 Template'
        long_desc 'A Basic HTML5 Template for new project.'
      end

      def self.call(client, data, _match)
        boilerplate = ERB.new(File.read('./views/html_boilerplate.erb')).result
        client.say(channel: data.channel, text: boilerplate)
      rescue StandardError => e
        client.say(channel: data.channel, text: "Je rencontre un problème: #{e.message}.")
      end
    end
  end
end

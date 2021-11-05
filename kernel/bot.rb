# frozen_string_literal: true

require "#{__dir__}/support"

# surcharge
class SlackRubyBot::Commands::Base
  def self.get(path)
    Net::HTTP.get(URI("#{ENV['HOST']}/#{path}"))
  end
end

# Configuration générale du robot

SlackRubyBot.configure do |config|
  config.token = ENV['SLACK_API_TOKEN']
  config.aliases = [':ds', 'dsbot']
end

module Drawsheep
  module Kernel
    ##
    # Le fameux robot !
    #
    class Bot < SlackRubyBot::Bot
      ##
      # Personalisation de la commande 'help'
      #
      command 'help' do |client, data, match|
        client.say(channel: data.channel, text: Support::Help.generate_help(match[:expression]))
      rescue StandardError => e
        client.say(channel: data.channel, text: "Je rencontre un problème: #{e.message}.")
      end
    end
  end
end

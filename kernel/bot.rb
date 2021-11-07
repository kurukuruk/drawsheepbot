# frozen_string_literal: true

require "#{__dir__}/config"
require "#{__dir__}/command"
require "#{__dir__}/support"

module Drawsheep
  module Kernel
    ##
    # Le coer du roboy
    #
    class Bot < SlackRubyBot::Bot
      ##
      # Personalisation de la commande 'help'
      #
      command 'help' do |client, data, match|
        client.say(channel: data.channel, text: Support::Help.generate_help(match[:expression]))
        super client, data, match
      rescue StandardError => e
        client.say(channel: data.channel, text: "Je rencontre un problème: #{e.message}.")
      end
    end
  end
end

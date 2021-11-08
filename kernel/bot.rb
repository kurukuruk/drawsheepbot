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
      rescue StandardError => e
        client.say(channel: data.channel, text: "Je rencontre un problème: #{e.message}.")
      end

      ##
      # Permet de charger les fichier nécessaire.
      # {NOTE : A AMELIORER}
      #
      def self.load_command(dir)
        file = "#{ROOT}/#{dir}/command.rb"
        puts "> Load command: #{file} "
        require file
        puts 'Command loaded.'
      end
    end
  end
end

# frozen_string_literal: true

require 'slack-ruby-bot'
require './app/support'

# Configuration générale du robot

SlackRubyBot.configure do |config|
  config.token = ENV['SLACK_API_TOKEN']
  config.aliases = [':ds', 'dsbot']
end

# Chargement des fichiers commands

Dir["#{__dir__}/commands/*.rb"].sort.each do |file|
  puts "Load command: #{file}"
  require file
end

##
# Le namespace de l'application du robot drawsheep
#
module Drawsheep
  ##
  # Le fameux robot !
  #
  class Bot < SlackRubyBot::Bot
    ##
    # Ajout d'une description du robot pour la commande help
    # #
    # help do
    #   title 'DrawsheepBot'
    #   desc 'Dessine moi un mouton.'
    #   long_desc 'https://github.com/kurukuruk/drawsheepbot'
    # end

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

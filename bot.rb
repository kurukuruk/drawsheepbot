require 'slack-ruby-bot'

Dir["#{__dir__}/commands/*.rb"].sort.each do |file|
  puts "Load command: #{file}"
  require file
end

##
# Configuration générale du robot
#
SlackRubyBot.configure do |config|
  config.token = ENV['SLACK_API_TOKEN']
  # config.aliases = [':pong:', 'pongbot']
end

##
# Le namespace de l'application du robot drawsheep

module Drawsheep
  ##
  # Le fameux robot !

  class Bot < SlackRubyBot::Bot
    ##
    # Ajout des éléments présents pour la commande help

    ###
    # Il serait bon de mettre chaque commande
    # soit dans un module dédié
    # soit dans une class dédiée
    # il y a les explications nécessaire dans la documentation de la lib
    ###

    help do
      title 'Drawsheep bot !'
      desc 'Dessine moi un mouton.'

      command 'ping' do
        desc 'ping pong dialogue.'
        long_desc 'Si tu dit ping, je dis pong !'
      end
    end

    ##
    # Ajout des commandes de base

    command 'ping' do |client, data, _match|
      client.say(text: 'pong', channel: data.channel)
    end
  end
end

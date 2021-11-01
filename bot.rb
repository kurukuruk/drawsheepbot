require 'slack-ruby-bot'

# Dir['/commands/*.rb'].each { |file| require file }

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

    help do
      title 'Drawsheep bot !'
      desc 'Dessine moi un mouton.'

      command 'ping' do
        desc 'ping pong dialogue.'
        long_desc 'Si tu dit ping, je dis pong !'
      end

      command 'hello_world' do
        desc 'Un simple \'Hello World!\'.'
        long_desc 'Si tu dit ping, je dis pong !'
      end

      command 'youtube' do
        desc 'Demande moi une recherche youtube.'
        long_desc 'Je parse les arguments et vous envoie un liens vers votre recherche sur youtube.'
      end
    end

    ##
    # Ajout des commandes

    command 'ping' do |client, data, _match|
      client.say(text: 'pong', channel: data.channel)
    end

    command 'hello_world' do |client, data, _match|
      client.say(text: 'Hello World!', channel: data.channel)
    end

    command 'youtube' do |client, data, match|
      url = 'https://www.youtube.com/results?search_query='
      search_query = match['expression']&.gsub(' ', '+')
      if search_query
        client.say(channel: data.channel, text: "#{url}#{search_query}")
      else
        client.say(channel: data.channel, text: 'Je ne peux pas effectuer de recherche dans le vide, voyons!')
      end
    end
  end
end

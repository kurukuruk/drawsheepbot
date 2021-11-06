# frozen_string_literal: true

require 'net/http'

# surcharge de la lib slack-ruby-bot pour des nécessitées de personnalisations
class SlackRubyBot::Commands::Base
  ##
  # récuperer une répoonse depuis une commande HTTP /GET
  #
  def self.get(path)
    Net::HTTP.get(URI("#{ENV['HOST']}/#{path}"))
  end

  ##
  # Proteger la méthode call
  #
  def self.call(client, data, _match)
  rescue StandardError => e
    client.say(channel: data.channel, text: "Je rencontre un problème: #{e.message}.")
  end
end

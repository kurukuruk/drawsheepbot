# frozen_string_literal: true

require 'slack-ruby-bot'

##
# Configuration générale du robot depuis la classe mère de la bibliothèque
#
SlackRubyBot.configure do |config|
  config.token = ENV['SLACK_API_TOKEN']
  config.aliases = [':ds']
end

require 'slack-ruby-bot'

SlackRubyBot.configure do |config|
  config.token = ENV['SLACK_API_TOKEN']
  # config.aliases = [':pong:', 'pongbot']
end

module Drawsheep
  class Bot < SlackRubyBot::Bot
    command 'ping' do |client, data, _match|
      client.say(text: 'pong', channel: data.channel)
    end
    command 'hello_world' do |client, data, _match|
      client.say(text: 'Hello World!', channel: data.channel)
    end
    command 'youtube' do |client, data, match|
      client.say(
        channel: data.channel,
        text: "https://www.youtube.com/results?search_query=#{match['expression'].gsub(' ', '+')}"
      )
    end
  end
end

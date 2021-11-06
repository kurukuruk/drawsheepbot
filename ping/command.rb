# frozen_string_literal: true

module Drawsheep
  module Ping
    class Command < ::SlackRubyBot::Commands::Base
      operator '-ping'
      command 'ping'

      help do
        title 'ping'
        desc 'ping pong dialogue (alias: "-ping")'
        long_desc 'Une partie de ping pong ?'
      end

      def self.call(client, data, match)
        client.say(text: get('/ping'), channel: data.channel)
        super client, data, match
      end
    end
  end
end

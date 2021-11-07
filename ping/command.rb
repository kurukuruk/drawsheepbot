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
        super client, data, match do
          client.say(text: get('/ping'), channel: data.channel)
        end
      end
    end
  end
end

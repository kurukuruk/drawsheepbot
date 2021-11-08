# frozen_string_literal: true

module Drawsheep
  module Norris
    class Command < Kernel::Command
      operator '-norris'
      command 'norris'

      help do
        title 'norris'
        desc 'Chuck Norris'
        long_desc 'get a Chuck Norris fact.'
      end

      def self.call(client, data, match)
        super client, data, match do
          client.say(channel: data.channel, text: get('/norris'))
        end
      end
    end
  end
end

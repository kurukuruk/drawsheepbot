# frozen_string_literal: true

module Drawsheep
  module Calcule
    class Commands < Kernel::Command
      operator '='
      command 'math'

      help do
        title 'Math'
        desc 'Opératiion mathématique (operateur: = )'
        long_desc ERB.new(File(__dir__ + '/' + 'desc.erb')).result_with_hash(
          operators: %w[+ - * / ^ % | & MAX MIN]
        )
      end

      def self.call(client, data, match)
        super client, data, match do
          client.say(channel: data.channel, text: post('/math', operation: match[:expression]))
        end
      end
    end
  end
end

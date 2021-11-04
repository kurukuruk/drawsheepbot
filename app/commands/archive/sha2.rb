# frozen_string_literal: true

require 'digest'

##
# La commande de Chuck Norris.
#
module Drawsheep
  module Commands
    class Sha2 < SlackRubyBot::Commands::Base
      operator '-sha2'
      command 'sha2'

      help do
        title 'sha2'
        desc 'Hash your string with sha2.'
        long_desc 'Hash your string with sha2 (-sha2 /256|334|512?/ string, 256 by default).'
      end

      def self.digest(match)
        args = match[:expression].split(' ')
        bit  = args.shift.to_i

        case bit
        when 256, 384, 512
          Digest::SHA2.new(bit).hexdigest args.join(' ')
        else
          Digest::SHA2.new(256).hexdigest match[:expression]
        end
      end

      def self.call(client, data, match)
        client.say(channel: data.channel, text: digest(match))
      rescue StandardError => e
        client.say(channel: data.channel, text: "Je rencontre un problème: #{e.message}.")
      end
    end
  end
end

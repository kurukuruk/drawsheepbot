# frozen_string_literal: true

require "#{__dir__}/zalgo"

module Drawsheep
  module Zalgo
    module Service
      def self.call(string)
        string&.to_zalgo || 'Rien à détruire...'
      end
    end
  end
end

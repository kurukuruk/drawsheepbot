# frozen_string_literal: true

require "#{__dir__}/math"

module Drawsheep
  module Calcule
    module Service
      def self.call(operation)
        return 'Rien à calculer' unless operation

        parse_to_math(operation) || 'Calcule impossible'
      end

      class << self
        # MATH_OPERATORS = %w[+ - * / % ^ | &].freeze

        def parse_to_math(operation)
          operation.gsub('amp;', '').gsub(' ', '').to_math if operation
        end
      end
    end
  end
end

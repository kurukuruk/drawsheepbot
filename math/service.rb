# frozen_string_literal: true

require 'dentaku'

module Drawsheep
  module Math
    module Service
      def self.call(operation)
        return 'Rien à calculer' unless operation

        result = Dentaku::Calculator.new.evaluate(parse_to_math(operation))

        if result
          result.to_s
        else
          'Calcule impossible'
        end
      end

      class << self
        # MATH_OPERATORS = %w[+ - * / % ^ | &].freeze

        def parse_to_math(operation)
          operation.gsub('amp;', '').gsub(' ', '') if operation
        end
      end
    end
  end
end

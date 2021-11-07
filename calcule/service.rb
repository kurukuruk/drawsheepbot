# frozen_string_literal: true

require 'dentaku'

module Drawsheep
  module Calcule
    module Service
      def self.call(operation)
        return 'Rien à calculer' unless operation

        operation = parse_for_math(operation)

        result = Dentaku::Calculator.new.evaluate(operation)

        if result
          result.to_s
        else
          'Calcule impossible'
        end
      end

      class << self
        # MATH_OPERATORS = %w[+ - * / % ^ | &].freeze

        def parse_for_math(str)
          str && str.gsub('amp;', '').gsub(' ', '') if str
        end
      end
    end
  end
end

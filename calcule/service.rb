# frozen_string_literal: true

require 'dentaku'

module Drawsheep
  module Calcule
    module Service
      def self.call(operation)
        return 'Rien à calculer' unless operation

        operation = parse_for_ruby operation

        result = Dentaku::Calculator.new.evaluate operation

        if result
          result.to_s
        else
          'Calcule impossible'
        end
      end

      def self.parse_for_uri(param)
        if param
          param.strip.gsub('^', '**')
        else
          ''
        end
      end

      def self.parse_for_ruby(param)
        if param
          param.strip.gsub('**', '^')
        else
          ''
        end
      end
    end
  end
end

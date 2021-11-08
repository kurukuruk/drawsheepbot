# frozen_string_literal: true

require 'dentaku'

class String
  def self.to_math
    Dentaku::Calculator.new.evaluate(self)
  end
end

# frozen_string_literal: true

require "#{__dir__}/kernel/bot"

module Drawsheep
  class Bot < Kernel::Bot
    load_command 'norris'
    load_command 'calcule'
    load_command 'zalgo'
  end
end

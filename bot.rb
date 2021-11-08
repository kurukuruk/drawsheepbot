# frozen_string_literal: true

require "#{__dir__}/kernel/bot"

module Drawsheep
  class Bot < Kernel::Bot
    load_command 'norris'
    load_command 'math'
    load_command 'zalgo'
  end
end

# frozen_string_literal: true

require "#{__dir__}/kernel/controller"
require "#{__dir__}/kernel/bot"

module Drawsheep
  class App < Kernel::Controller
    load_files 'norris' do
      use Norris::Controller
    end

    load_files 'calcule' do
      use Calcule::Controller
    end

    load_files 'zalgo' do
      use Zalgo::Controller
    end

    # ...

    load_files 'ping' do
      use Ping::Controller
    end
  end
end

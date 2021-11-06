# frozen_string_literal: true

require "#{__dir__}/kernel/controller"
require "#{__dir__}/kernel/bot"

##
# L'application principale.
# Elle est le point d'entrée principale de toute les routes HTTP.
#
module Drawsheep
  class App < Kernel::Controller
    # norris
    load_files 'norris' do
      use Norris::Controller
    end

    # calcule
    load_files 'calcule' do
      use Calcule::Controller
    end

    # ...

    # ping
    load_files 'ping' do
      use Ping::Controller
    end
  end
end

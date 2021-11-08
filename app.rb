# frozen_string_literal: true

require "#{__dir__}/kernel/controller"

module Drawsheep
  class App < Kernel::AppController
    load_controller 'norris'
    load_controller 'calcule'
    load_controller 'zalgo'

    use Norris::Controller
    use Calcule::Controller
    use Zalgo::Controller
  end
end

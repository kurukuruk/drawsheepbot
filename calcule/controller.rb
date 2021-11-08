# frozen_string_literal: true

require "#{__dir__}/service.rb"

module Drawsheep
  module Calcule
    class Controller < Kernel::BaseController
      post '/calcule' do
        Service.call(params['operation'])
      end
    end
  end
end

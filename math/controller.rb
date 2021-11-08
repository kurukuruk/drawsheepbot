# frozen_string_literal: true

require "#{__dir__}/service.rb"

module Drawsheep
  module Math
    class Controller < Kernel::BaseController
      post '/math' do
        Service.call(params['operation'])
      end
    end
  end
end

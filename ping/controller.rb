# frozen_string_literal: true

require "#{__dir__}/service.rb"

module Drawsheep
  module Ping
    class Controller < Kernel::BaseController
      get '/ping' do
        Service.call
      end
    end
  end
end

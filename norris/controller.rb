# frozen_string_literal: true

require "#{__dir__}/service.rb"

module Drawsheep
  module Norris
    class Controller < Kernel::BaseController
      get '/norris' do
        Service.call
      end
    end
  end
end

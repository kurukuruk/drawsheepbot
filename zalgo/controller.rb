# frozen_string_literal: true

require "#{__dir__}/service.rb"

module Drawsheep
  module Zalgo
    class Controller < Kernel::BaseController
      post '/zalgo' do
        Service.call(params['string'])
      end
    end
  end
end

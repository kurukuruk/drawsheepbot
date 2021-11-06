# frozen_string_literal: true

module Drawsheep
  module Ping
    class Controller < Kernel::Controller
      get '/ping' do
        Service.call
      end
    end
  end
end
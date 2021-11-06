# frozen_string_literal: true

module Drawsheep
  module Norris
    class Controller < Kernel::Controller
      get '/norris' do
        Service.call
      end
    end
  end
end

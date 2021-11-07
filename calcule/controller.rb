# frozen_string_literal: true

module Drawsheep
  module Calcule
    class Controller < Kernel::Controller
      post '/calcule' do
        Service.call(params['operation'])
      end
    end
  end
end

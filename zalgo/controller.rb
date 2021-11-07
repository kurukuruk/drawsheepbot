# frozen_string_literal: true

module Drawsheep
  module Zalgo
    class Controller < Kernel::Controller
      post '/zalgo' do
        Service.call(params['text'])
      end
    end
  end
end

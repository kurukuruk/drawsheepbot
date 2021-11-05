module Drawsheep
  module Ping
    class Controller < ::Drawsheep::Kernel::Base
      get '/ping' do
        'pong'
      end
    end
  end
end

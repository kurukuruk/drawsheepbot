##
# Le controller de Ping.
# Renvoie un GET 'pong'
# A charger dans l'appication, la classe gère ses controllers
#
module Drawsheep
  module Ping
    class Controller < ::Drawsheep::Kernel::Base
      get '/ping' do
        'pong'
      end
    end
  end
end

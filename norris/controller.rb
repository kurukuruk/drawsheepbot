# frozen_string_literal: true

##
# Le controller de Chuck Norris.
# Permet d'appeler l'api des blagues sur Chuck Norris.
# A charger dans l'appication, la classe gère ses controllers
#
module Drawsheep
  module Norris
    class Controller < Kernel::Controller
      get '/norris' do
        Service.call
      end
    end
  end
end

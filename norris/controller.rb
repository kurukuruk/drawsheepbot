module Drawsheep
  module Norris
    class Controller < ::Drawsheep::Kernel::Base
      get '/norris' do
        response = JSON(Net::HTTP.get(URI('https://api.chucknorris.io/jokes/random'))).transform_keys(&:to_sym)
        if response[:value]
          response[:value]
        elsif response[:error]
          "#{response[:error]} : #{response[:message]}"
        end
      end
    end
  end
end

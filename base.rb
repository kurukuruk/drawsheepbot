require 'sinatra/base'
require 'sinatra/reloader'

##
# namespace

module Drawsheep
  ##
  # Notre controlleur de base

  class Base < Sinatra::Base
    ##
    # configuration generale

    configure do
      set :public_folder, 'public'
      set :title, 'DrawsheepBot' # code.richard
      set :author, 'Les drawhseepers'
      set :created_at, '2021'
      set :description, 'Web app pour DrawsheepBot'
    end

    ##
    # configuration développement

    configure :development do
      register Sinatra::Reloader
    end
  end
end

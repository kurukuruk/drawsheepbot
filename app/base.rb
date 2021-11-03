# frozen_string_literal: true

require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/json'
require 'json'

require 'net/http'

##
# namespace

module Drawsheep
  ##
  # Notre controlleur de base
  #
  class Base < Sinatra::Base
    ##
    # configuration generale
    #
    configure do
      set :public_folder, 'public'
      set :title, 'DrawsheepBot' # code.richard
      set :author, 'Les drawhseepers'
      set :created_at, '2021'
      set :description, 'Web app pour DrawsheepBot'
    end

    ##
    # configuration développement
    #
    configure :development do
      register Sinatra::Reloader
    end

    get '/' do
      url = 'https://api.chucknorris.io/jokes/random'
      uri = URI(url)
      response = Net::HTTP.get(uri)
      res = JSON.parse(response)
      # append the payload to a file
      File.open('events.log', 'a') do |f|
        f.puts(res['value'])
      end
      res['value']
    end
  end
end

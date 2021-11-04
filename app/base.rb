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

    ##
    # 404
    not_found do |e|
      status 404
      @error = e
      "404 NOT FOUND : #{e.message}"
    end

    get '/norris' do
      response = JSON(Net::HTTP.get(URI('https://api.chucknorris.io/jokes/random'))).transform_keys(&:to_sym)
      if response[:value]
        response[:value]
      elsif response[:error]
        "#{response[:error]} : #{response[:message]}"
      end
    end

    get '/ping' do
      'pong'
    end

    get '/youtube/:search_query' do
      "https://www.youtube.com/results?search_query=#{params[:search_query].strip}"
    end

    get '/youtube' do
      'https://www.youtube.com'
    end
  end
end

# frozen_string_literal: true

require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/json'

module Drawsheep
  module Kernel
    ##
    # Notre controlleur de base
    #
    class BaseController < Sinatra::Base
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
        # exceptions
        disable :raise_errors
        disable :show_exceptions

        # reload
        register Sinatra::Reloader
        after_reload do
          puts "#{self} reloaded"
        end
      end

      ##
      # 404
      #
      not_found do |e|
        status 404
        @error = e
        "404: #{e.message}"
      end
    end

    class AppController < BaseController
      ##
      # Permet de charger les fichier nécessaire.
      # {NOTE : A AMELIORER}
      #
      def self.load_controller(dir)
        file = "#{ROOT}/#{dir}/controller.rb"
        puts "> Load controller: #{file} "
        require file
        puts 'Controller loaded.'
      end
    end
  end
end

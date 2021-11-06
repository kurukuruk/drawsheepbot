# frozen_string_literal: true

require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/json'

module Drawsheep
  module Kernel
    ##
    # Notre controlleur de base
    #
    class Controller < Sinatra::Base
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
      #
      not_found do |e|
        status 404
        @error = e
        "404: #{e.message}"
      end

      ##
      # Permet de charger les fichier nécessaire depuis un des répèrtoire de l'application.
      # {NOTE : A AMELIORER}
      #
      def self.load_files(dir)
        Dir["#{ROOT}/#{dir}/*.rb"].sort.each do |file|
          puts "> load : #{file} "
          require file
          puts 'Loaded'
        end

        yield self
      end
    end
  end
end

# frozen_string_literal: true

require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/json'

module Drawsheep
  module Kernel
    class BaseController < Sinatra::Base
      configure do
        set :public_folder, 'public'
        set :title, 'DrawsheepBot'
        set :author, 'Les drawhseepers'
        set :created_at, '2021'
        set :description, 'Web app pour DrawsheepBot'
        set :root, ROOT
        # set :lock, true
        # set :static, true
      end

      configure :development do
        disable :raise_errors
        disable :show_exceptions
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

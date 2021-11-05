# frozen_string_literal: true

module Drawsheep
  module Kernel
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

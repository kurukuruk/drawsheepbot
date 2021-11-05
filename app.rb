require 'slack-ruby-bot'
require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/json'
require 'json'
require 'net/http'

require "#{__dir__}/kernel/base"
require "#{__dir__}/kernel/bot"

module Drawsheep
  class App < Kernel::Base
    # norris
    load_files 'norris' do
      use Drawsheep::Norris::Controller
    end

    # ...

    # ping
    load_files 'ping' do
      use ::Drawsheep::Ping::Controller
    end
  end
end

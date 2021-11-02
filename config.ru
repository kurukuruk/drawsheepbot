# frozen_string_literal: true

$LOAD_PATH.unshift(File.dirname(__FILE__))
Thread.abort_on_exception = true

##
# variables d'environnement

require 'dotenv'

Dotenv.load

require './env'

##
# le bot

require './app/bot'

Thread.new do
  Drawsheep::Bot.run
rescue Exception => e
  warn "ERROR: #{e}"
  warn e.backtrace
  raise e
end

##
# la base sinatra

require './app/base'

run Drawsheep::Base

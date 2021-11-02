# frozen_string_literal: true

$LOAD_PATH.unshift(File.dirname(__FILE__))

##
# variables d'environnement

require 'dotenv'

Dotenv.load

require './env'

Thread.abort_on_exception = true

##
# le bot

require './bot'

Thread.new do
  Drawsheep::Bot.run
rescue Exception => e
  warn "ERROR: #{e}"
  warn e.backtrace
  raise e
end

##
# la base sinatra

require './base'

run Drawsheep::Base

# frozen_string_literal: true

$LOAD_PATH.unshift(File.dirname(__FILE__))

Thread.abort_on_exception = true

ROOT = File.expand_path(__dir__)

# chargmeent des variables d'environnement

require 'dotenv'

Dotenv.load

# chargement du bot

require './bot'

bot = Drawsheep::Bot

Thread.new do
  bot.run
rescue Exception => e
  warn "ERROR: #{e}"
  warn e.backtrace
  raise e
end

# charement de l'applicatipon web

require './app'

app = Drawsheep::App

run app

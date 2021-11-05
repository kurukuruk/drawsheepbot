# frozen_string_literal: true

$LOAD_PATH.unshift(File.dirname(__FILE__))
Thread.abort_on_exception = true

ROOT = File.expand_path(__dir__)

# chargmeent des variables d'environnement

require 'dotenv'

Dotenv.load

# charement de l'applicatipons

require './app'

# robot
bot = Drawsheep::Kernel::Bot

# application back
app = Drawsheep::App

# thread pour le robot
Thread.new do
  bot.run
rescue Exception => e
  warn "ERROR: #{e}"
  warn e.backtrace
  raise e
end

# thread rack pour l'application back
run app

# frozen_string_literal: true

$LOAD_PATH.unshift(File.dirname(__FILE__))
Thread.abort_on_exception = true

ROOT = File.expand_path(__dir__)

##
# variables d'environnement

require 'dotenv'

Dotenv.load

require './app'

bot = Drawsheep::Kernel::Bot
app = Drawsheep::App

Thread.new do
  bot.run
rescue Exception => e
  warn "ERROR: #{e}"
  warn e.backtrace
  raise e
end

run app

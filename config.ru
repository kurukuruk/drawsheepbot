# frozen_string_literal: true

$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'dotenv'

Dotenv.load

Thread.abort_on_exception = true

require 'bot'
Thread.new do
  Drawsheep::Bot.run
rescue Exception => e
  warn "ERROR: #{e}"
  warn e.backtrace
  raise e
end

require 'base'
run Drawsheep::Base

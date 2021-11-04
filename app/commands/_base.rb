class SlackRubyBot::Commands::Base
  def self.get(path)
    Net::HTTP.get(URI("#{ENV['HOST']}/#{path}"))
  end
end

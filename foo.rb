class String
  def to_al_bhed
    al_bhed  = %w[Y P L T A V K R E Z G M S H U B X N C D I J F Q O W].freeze
    alphabet = ('A'..'Z').to_a.freeze

    chars.map do |c|
      if alphabet.include? c.upcase
        new_c = al_bhed[alphabet.index(c.upcase)]
        if c == c.downcase
          new_c.downcase
        else
          new_c
        end
      else
        c
      end
    end.join
  end
end

p 'Hello World 666'.to_al_bhed

require 'JSON'
require 'ERB'
json = JSON.parse(File.read('package.json'), symbolize_names: true)
p json.class
p json

info = {}
other_commands_descs = []
puts(ERB.new(File.read('./app/help.erb')).result_with_hash(info: info, other_commands_descs: other_commands_descs))

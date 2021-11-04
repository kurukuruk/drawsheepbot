# frozen_string_literal: true

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

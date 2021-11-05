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

  ##
  # Transform a String into zalgo String.
  # @return [String]
  #
  def to_zalgo(down = 5, mid = 5, up = 5, random: false)
    cc = combining_chars
    chars.map do |char|
      set_combining_chars('',     down, cc[:down],  random) +
        set_combining_chars(char, mid,  cc[:mid],   random) +
        set_combining_chars('',   up,   cc[:up],    random)
    end.join
  end

  def combining_chars
    ##
    # The all combining unicode chars
    # see : https://en.wikipedia.org/wiki/Zalgo_text
    # inspired by : https://eeemo.net/
    # CHARS  = %W[\u0300 \u0301 \u0302 \u0303 \u0304 \u0305 \u0306 \u0307 \u0308 \u0309 \u030a \u030b \u030c \u030d \u030e \u030f \u0310 \u0311 \u0312 \u0313 \u0314 \u0315 \u0316 \u0317 \u0318 \u0319 \u031a \u031b \u031c \u031d \u031e \u031f \u0320 \u0321 \u0322 \u0323 \u0324 \u0325 \u0326 \u0327 \u0328 \u0329 \u032a \u032b \u032c \u032d \u032e \u032f \u0330 \u0331 \u0332 \u0333 \u0334 \u0335 \u0336 \u0337 \u0338 \u0339 \u033a \u033b \u033c \u033d \u033e \u033f \u0340 \u0341 \u0342 \u0343 \u0344 \u0345 \u0346 \u0347 \u0348 \u0349 \u034a \u034b \u034c \u034d \u034e \u034f \u0350 \u0351 \u0353 \u0354 \u0355 \u0356 \u0357 \u0358 \u0359 \u035a \u035b \u035c \u035d \u035e \u035f \u0360 \u0361 \u0362 \u0363 \u0364 \u0365 \u0366 \u0367 \u0368 \u0369 \u036a \u036b \u036c \u036d \u036e \u036f \u0489 ].freeze
    {
      down: [
        "\u0316", # ̖
        "\u0317", # ̗
        "\u0318", # ̘
        "\u0319", # ̙
        "\u031c", # ̜
        "\u031d", # ̝
        "\u031e", # ̞
        "\u031f", # ̟
        "\u0320", # ̠
        "\u0324", # ̤
        "\u0325", # ̥
        "\u0326", # ̦
        "\u0329", # ̩
        "\u032a", # ̪
        "\u032b", # ̫
        "\u032c", # ̬
        "\u032d", # ̭
        "\u032e", # ̮
        "\u032f", # ̯
        "\u0330", # ̰
        "\u0331", # ̱
        "\u0332", # ̲
        "\u0333", # ̳
        "\u0339", # ̹
        "\u033a", # ̺
        "\u033b", # ̻
        "\u033c", # ̼
        "\u0345", # ͅ
        "\u0347", # ͇
        "\u0348", # ͈
        "\u0349", # ͉
        "\u034d", # ͍
        "\u034e", # ͎
        "\u0353", # ͓
        "\u0354", # ͔
        "\u0355", # ͕
        "\u0356", # ͖
        "\u0359", # ͙
        "\u035a", # ͚
        "\u0323"  # ̣
      ],

      mid: [
        "\u0315", # ̕
        "\u031b", # ̛
        "\u0340", # ̀
        "\u0341", # ́
        "\u0358", # ͘
        "\u0321", # ̡
        "\u0322", # ̢
        "\u0327", # ̧
        "\u0328", # ̨
        "\u0334", # ̴
        "\u0335", # ̵
        "\u0336", # ̶
        "\u034f", # ͏
        "\u035c", # ͜
        "\u035d", # ͝
        "\u035e", # ͞
        "\u035f", # ͟
        "\u0360", # ͠
        "\u0362", # ͢
        "\u0338", # ̸
        "\u0337", # ̷
        "\u0361", # ͡
        "\u0489"  # ҉_
      ],

      up: [
        "\u030d", # ̍
        "\u030e", # ̎
        "\u0304", # ̄
        "\u0305", # ̅
        "\u033f", # ̿
        "\u0311", # ̑
        "\u0306", # ̆
        "\u0310", # ̐
        "\u0352", # ͒
        "\u0357", # ͗
        "\u0351", # ͑
        "\u0307", # ̇
        "\u0308", # ̈
        "\u030a", # ̊
        "\u0342", # ͂
        "\u0343", # ̓
        "\u0344", # ̈́
        "\u034a", # ͊
        "\u034b", # ͋
        "\u034c", # ͌
        "\u0303", # ̃
        "\u0302", # ̂
        "\u030c", # ̌
        "\u0350", # ͐
        "\u0300", # ̀
        "\u0301", # ́
        "\u030b", # ̋
        "\u030f", # ̏
        "\u0312", # ̒
        "\u0313", # ̓
        "\u0314", # ̔
        "\u033d", # ̽
        "\u0309", # ̉
        "\u0363", # ͣ
        "\u0364", # ͤ
        "\u0365", # ͥ
        "\u0366", # ͦ
        "\u0367", # ͧ
        "\u0368", # ͨ
        "\u0369", # ͩ
        "\u036a", # ͪ
        "\u036b", # ͫ
        "\u036c", # ͬ
        "\u036d", # ͭ
        "\u036e", # ͮ
        "\u036f", # ͯ
        "\u033e", # ̾
        "\u035b", # ͛
        "\u0346", # ͆
        "\u031a"  # ̚
      ]
    }
  end

  private

  def set_combining_chars(string, num, combining_chars, with_random)
    num = rand(num).to_i if with_random
    num.times do
      string += combining_chars.sample
    end
    string
  end
end
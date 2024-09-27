class Game
  def initialize
    reset
  end

  def reset
    @score = 0
    @level = 1
  end

  def do
    if Input.key_push?(K_ESCAPE)
      return :title, nil
    end

    Window.draw_font(0, 0, "レベル: #{@level}", $font30)
    Window.draw_font(0, 30, "スコア: #{@score}", $font30)

    if Input.key_push?(K_RETURN)
      res = [@level, @score]
      reset
      return :result, res
    end
    return :game, nil
  end
end

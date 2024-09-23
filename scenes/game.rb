class Game
  def initialize

  end

  def do
    Window.draw_font(0, 0, "Game", $font30)
    if Input.key_push?(K_RETURN)
      return :result, nil
    end
    return :game, nil
  end
end

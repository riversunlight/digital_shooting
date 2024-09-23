class Title
  def initialize

  end

  def do
    Window.draw_font(0, 0, "Title", $font30)
    if Input.key_push?(K_RETURN)
      return :game, nil
    end
    return :title, nil
  end
end

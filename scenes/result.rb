class Result
  def initialize

  end

  def do
    Window.draw_font(0, 0, "Result", $font30)
    if Input.key_push?(K_RETURN)
      return :title, nil
    end
    return :result, nil
  end
end

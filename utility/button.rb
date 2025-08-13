class Button
  def initialize(args={})
    @x = (args[:x] || 0) * $scale
    @y = (args[:y] || 0) * $scale
    @width = (args[:width] || 200) * $scale
    @height = (args[:height] || 300) * $scale
    @color = args[:color] || [255, 255, 255, 0]
    @msg = args[:msg] || ""
  end

  def draw
    Window.draw_box_fill(@x, @y, @x + @width, @y + @height, @color)
    Window.draw_font(@x + 10, @y + 10, @msg, $font30)
  end

  def click?
    if Input.mouse_push?(M_LBUTTON) && mouse_on
      return true
    end
    false
  end

  private

  def mouse_on
    if Input.mouse_pos_x >= @x && Input.mouse_pos_x <= @x + @width && Input.mouse_pos_y >= @y && Input.mouse_pos_y <= @y + @height
      return true
    end
    false
  end
end

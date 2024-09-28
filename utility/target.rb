class Target
  attr_accessor :point
  def initialize(args={})
    @base_x = args[:base_x]
    @base_y = args[:base_y]
    @move_kind = args[:move_kind]
    @point = args[:point]
    @x = @base_x
    @y = @base_y
  end

  def draw
    Window.draw_circle_fill(@x, @y, 40, C_WHITE)
  end

  def move
    case @move_kind
    when :nomove
      # No Move
    end
  end

  def hit?
    if Input.mouse_push?(M_LBUTTON) && (Input.mouse_pos_x - @x) ** 2 + (Input.mouse_pos_y - @y) ** 2 <= 40 ** 2
      return true
    end
    false
  end

end

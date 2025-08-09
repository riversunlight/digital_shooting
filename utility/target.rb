class Target
  attr_accessor :point
  def initialize(args={})
    @base_x = args[:base_x]
    @base_y = args[:base_y]
    @move_kind = args[:move_kind]
    @point = args[:point]
    @x = @base_x
    @y = @base_y
    @time = args[:start_time] || 0
    @radius = args[:radius] || 30
    @speed = args[:speed] || 1
  end

  def draw
    Window.draw_circle_fill(@x, @y, 40, C_WHITE)
  end

  def move
    case @move_kind
    when :nomove
      # No Move
    when :circle
      @time += @speed
      @x = @base_x + @radius * Math.cos(@time/100.0)
      @y = @base_y + @radius * Math.sin(@time/100.0)
    when :xpendulum
      @x = @base_x + @radius * Math.sin(@time/100.0)
      @y = @base_y
      @time += @speed
    when :ypendulum
      @x = @base_x
      @y = @base_y + @radius * Math.sin(@time/100.0)
      @time += @speed
    when :square
      @time += @speed
      k = @time / 100
      if k == 0
        @x = @base_x - @radius + (@radius * 2 / 100.0) * (@time % 100)
        @y = @base_y + @radius
      elsif k == 1
        @x = @base_x + @radius
        @y = @base_y + @radius - (@radius * 2 / 100.0) * (@time % 100)
      elsif k == 2
        @x = @base_x + @radius - (@radius * 2 / 100.0) * (@time % 100)
        @y = @base_y - @radius
      elsif k == 3
        @x = @base_x - @radius
        @y = @base_y - @radius + (@radius * 2 / 100.0) * (@time % 100)
      end
      @time %= 400
    when :warp
      @time += @speed
      if @time >= 1000
        @time = 0
        @x = @base_x + Random.rand(-@radius .. @radius)
        @y = @base_y + Random.rand(-@radius .. @radius)
      end
    end
  end

  def hit?
    if Input.mouse_push?(M_LBUTTON) && (Input.mouse_pos_x - @x) ** 2 + (Input.mouse_pos_y - @y) ** 2 <= 40 ** 2
      return true
    end
    false
  end

end

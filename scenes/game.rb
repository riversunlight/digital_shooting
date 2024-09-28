class Game
  def initialize
    reset
  end

  def reset
    @score = 0
    @level = 0
    @targets = []
    @start_time = nil
  end

  # 的の生成
  def generate
    case @level
    when 1
      @start_time = Time.now
      @targets << Target.new(base_x: 200, base_y:200, move_kind: :nomove, point: 10)
    when 2
      @targets << Target.new(base_x: 100, base_y:200, move_kind: :nomove, point: 10)
      @targets << Target.new(base_x: 200, base_y:300, move_kind: :nomove, point: 10)
    when 3
    when 4
    when 5
    when 6
    when 7
    when 8
    when 9
    when 10
    end
  end

  def do
    if Input.key_push?(K_ESCAPE)
      return :title, nil
    end

    Window.draw_font(0, 0, "レベル: #{@level}", $font30)
    Window.draw_font(0, 30, "スコア: #{@score}", $font30)

    if @targets.size == 0
      @level += 1
      generate
    end

    @targets.each do |target|
      target.draw
    end

    @targets.delete_if do |target|
      if target.hit?
        @score += target.point
        true
      else
        false
      end
    end

    if Input.key_push?(K_RETURN)
      res = [@level, @score]
      reset
      return :result, res
    end
    return :game, nil
  end
end

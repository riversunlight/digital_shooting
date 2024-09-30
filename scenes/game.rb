class Game
  def initialize
    reset
  end

  def reset
    @score = 0
    @level = 0
    @targets = []
    @start_time = nil
    @limit_time = 60
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

  #TODO: 終了がちゃんとでるように!
  # sleep 2ではなく、メインループから戻りながら2秒待機するだけでよい
  def end_view
    Window.draw_font(100, 100, "終了", $font90)
    sleep 2
    return :result,  [@level, @score]
  end

  def do
    if Input.key_push?(K_ESCAPE)
      return :title, nil
    end

    passed_time = 0
    passed_time = Time.now - @start_time if @start_time

    Window.draw_font(0, 0, "レベル: #{@level}", $font30)
    Window.draw_font(0, 30, "スコア: #{@score}", $font30)
    Window.draw_font(300, 0, "残り時間: #{(@limit_time - passed_time).to_i}秒", $font30)

    if passed_time > @limit_time
      return end_view
    end

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

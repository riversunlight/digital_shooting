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
      @targets << Target.new(base_x: 300, base_y:200, move_kind: :nomove, point: 10)
      @targets << Target.new(base_x: 200, base_y:450, move_kind: :nomove, point: 10)
      @targets << Target.new(base_x: 550, base_y:400, move_kind: :nomove, point: 10)
    when 4
      4.times do
        @targets << Target.new(base_x: Random.rand(250 .. 350), base_y:Random.rand(250 .. 450), move_kind: :nomove, point: 10)
      end
    when 5
      4.times do
        @targets << Target.new(base_x: Random.rand(100 .. 550), base_y:Random.rand(200 .. 450), move_kind: :nomove, point: 10)
      end
    when 6
      @targets << Target.new(base_x: 200, base_y: 300, move_kind: :circle, point: 10, speed: 4, radius:100)
    when 7
      @targets << Target.new(base_x: 200, base_y: 100, move_kind: :warp, point: 10, speed: 10, radius:100)
      @targets << Target.new(base_x: 100, base_y: 200, move_kind: :warp, point: 10, speed: 10, radius:100)
      @targets << Target.new(base_x: 200, base_y: 300, move_kind: :warp, point: 10, speed: 10, radius:100)
      @targets << Target.new(base_x: 300, base_y: 200, move_kind: :warp, point: 10, speed: 10, radius:100)
      @targets << Target.new(base_x: 400, base_y: 400, move_kind: :warp, point: 10, speed: 10, radius:100)

    when 8
      @targets << Target.new(base_x: 300, base_y: 200, move_kind: :xpendulum, point: 10, speed: 10, radius:100)
      @targets << Target.new(base_x: 300, base_y: 400, move_kind: :xpendulum, point: 10, speed: 10, radius:100)
      @targets << Target.new(base_x: 50, base_y: 300, move_kind: :ypendulum, point: 10, speed: 10, radius:100)
      @targets << Target.new(base_x: 500, base_y: 300, move_kind: :ypendulum, point: 10, speed: 10, radius:100)
    when 9
      @targets << Target.new(base_x: 200, base_y: 200, move_kind: :nomove, point: 10, speed: 10)
      @targets << Target.new(base_x: 100, base_y: 300, move_kind: :nomove, point: 10, speed: 10)

      @targets << Target.new(base_x: 300, base_y: 300, move_kind: :warp, point: 10, speed: 20, radius:100)
      @targets << Target.new(base_x: 500, base_y: 400, move_kind: :warp, point: 10, speed: 10, radius:100)

      @targets << Target.new(base_x: 300, base_y: 300, move_kind: :xpendulum, point: 10, speed: 10, radius:100)
      @targets << Target.new(base_x: 300, base_y: 300, move_kind: :ypendulum, point: 10, speed: 10, radius:100)

      @targets << Target.new(base_x: 300, base_y: 300, move_kind: :circle, point: 10, speed: 10, radius:100)
    when 10
      @targets << Target.new(base_x: 300, base_y: 300, move_kind: :square, point: 10, speed: 2, radius:100)
      @targets << Target.new(base_x: 300, base_y: 300, move_kind: :square, point: 10, speed: 2, radius:100, start_time: 50)
      @targets << Target.new(base_x: 300, base_y: 300, move_kind: :square, point: 10, speed: 2, radius:100, start_time: 100)
      @targets << Target.new(base_x: 300, base_y: 300, move_kind: :square, point: 10, speed: 2, radius:100, start_time: 150)
      @targets << Target.new(base_x: 300, base_y: 300, move_kind: :square, point: 10, speed: 2, radius:100, start_time: 250)
      @targets << Target.new(base_x: 300, base_y: 300, move_kind: :square, point: 10, speed: 2, radius:100, start_time: 200)
      @targets << Target.new(base_x: 300, base_y: 300, move_kind: :square, point: 10, speed: 2, radius:100, start_time: 350)
      @targets << Target.new(base_x: 300, base_y: 300, move_kind: :square, point: 10, speed: 2, radius:100, start_time: 300)
    when 11
      20.times do
        @targets << Target.new(base_x: Random.rand(50 .. 550), base_y:Random.rand(100 .. 450), move_kind: :warp, speed: 30, point: 10, radius: 50)
      end
    when 12
      5.times do |i|
        @targets << Target.new(base_x: 50 + i * 100, base_y:300, move_kind: :ypendulum, speed: 15, point: 10, radius: 100)
      end
      5.times do |i|
        @targets << Target.new(base_x: 300, base_y:100 + i * 50, move_kind: :xpendulum, speed: 15, point: 10, radius: 100)
      end
    when 13
      5.times do |i|
        @targets << Target.new(base_x: 300, base_y:300, move_kind: :circle, speed: 15, point: 10, radius: 30 + i * 20)
      end
      @targets << Target.new(base_x: 400, base_y:400, move_kind: :circle, speed: 15, point: 10, radius: 80)
      @targets << Target.new(base_x: 200, base_y:200, move_kind: :xpendulum, speed: 15, point: 10, radius: 80)
      @targets << Target.new(base_x: 280, base_y: 300, move_kind: :square, point: 10, speed: 2, radius:100)
      @targets << Target.new(base_x: 300, base_y: 280, move_kind: :square, point: 10, speed: 2, radius:100, start_time: 50)
      @targets << Target.new(base_x: 320, base_y: 300, move_kind: :square, point: 10, speed: 2, radius:100, start_time: 100)
      @targets << Target.new(base_x: 300, base_y: 320, move_kind: :square, point: 10, speed: 2, radius:100, start_time: 150)
      @targets << Target.new(base_x: 100, base_y: 400, move_kind: :square, point: 10, speed: 2, radius:100, start_time: 250)
    when 14
      5.times do |i|
        @targets << Target.new(base_x: 50 + i * 100, base_y:300, move_kind: :circle, speed: 20, point: 10, radius: 20)
      end
      5.times do |i|
        @targets << Target.new(base_x: 300, base_y:100 + i * 50, move_kind: :circle, speed: 20, point: 10, radius: 20)
      end
      5.times do |i|
        @targets << Target.new(base_x: 300, base_y:100 + i * 50, move_kind: :xpendulum, speed: 30, point: 10, radius: 150)
      end
    when 15
      40.times do
        @targets << Target.new(base_x: Random.rand(50 .. 550), base_y:Random.rand(100 .. 450), move_kind: :warp, speed: 30, point: 10, radius: 50)
      end
      8.times do |i|
        @targets << Target.new(base_x: 50 + i * 100, base_y:300, move_kind: :ypendulum, speed: 15, point: 10, radius: 100)
      end
      8.times do |i|
        @targets << Target.new(base_x: 300, base_y:100 + i * 50, move_kind: :xpendulum, speed: 15, point: 10, radius: 100)
      end
      5.times do |i|
        @targets << Target.new(base_x: 50 + i * 100, base_y:300, move_kind: :circle, speed: 20, point: 10, radius: 20)
      end
    when 16
      #TODO: 制限時間的に動かないのを修正
      @level = 1
    end
  end

  #TODO: 終了がちゃんとでるように!
  # sleep 2ではなく、メインループから戻りながら2秒待機するだけでよい
  def end_view
    Window.draw_font(100, 100, "終了", $font90)
    return :game,  nil
  end

  def end_game
    res = [@level, @score]
    reset
    return :result, res
  end

  def do(args = {})
    if Input.key_push?(K_ESCAPE)
      return :title, nil
    end

    passed_time = 0
    passed_time = Time.now - @start_time if @start_time

    Window.draw_font(0, 0, "レベル: #{@level}", $font30)
    Window.draw_font(0, 30, "スコア: #{@score}", $font30)
    Window.draw_font(500, 0, "残り時間: #{[(@limit_time - passed_time).to_i, 0].max}秒", $font30)

    if passed_time > @limit_time
      if passed_time > @limit_time + 2
        return end_game
      end
      return end_view
    end

    if @targets.size == 0
      @level += 1
      generate
    end

    @targets.each do |target|
      target.move
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

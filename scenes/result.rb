class Result
  def initialize
    @game_button = Button.new(x: 200, y:250, width: 200, height:60, color: [255, 255, 255, 0], msg: "もう一回遊ぶ")
    @title_button = Button.new(x: 200, y:320, width: 200, height:60, color: [255, 255, 255, 0], msg: "タイトルへ")
  end

  def decide_rank(score)
    if score < 100
      return "C"
    elsif score < 200
      return "B"
    elsif score < 300
      return "A"
    else
      return "S"
    end
  end

  def do(args = {})
    level, score = args[:res]
    Window.draw_font(200, 30, "レベル: #{level}", $font60)
    Window.draw_font(200, 90, "スコア: #{score}", $font60)

    rank = decide_rank(score)
    Window.draw_font(200, 150, "#{rank}ランク", $font90)
    @game_button.draw
    @title_button.draw

    if @game_button.click?
      return :game, nil
    end
    if @title_button.click?
      return :title, nil
    end

    if Input.key_push?(K_RETURN)
      return :title, nil
    end
    return :result, args[:res]
  end
end

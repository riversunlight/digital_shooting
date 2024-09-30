class Title
  def initialize
    @start_button = Button.new(x: 200, y: 220, width: 200, height: 60, color: [255, 255, 255, 0], msg: "ゲームスタート")
  end

  def do(args = {})
    @start_button.draw
    Window.draw_font(160, 140, "デジタル射的", $font60)
    if @start_button.click?
      return :game, nil
    end
    return :title, nil
  end
end

class SceneManager

  def initialize
    @scene = :title
    @scenes = {title: Title.new(), game: Game.new(), result: Result.new()}
    @res = nil
  end

  def do
    @scene, @res = @scenes[@scene].do(res: @res)
  end
end

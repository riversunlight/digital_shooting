class SceneManager

  def initialize
    @scene = :title
    @scenes = {title: Title.new(), game: Game.new(), result: Result.new()}
  end

  def do
    @scene, res = @scenes[@scene].do
  end
end

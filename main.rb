require 'dxruby'
require 'singleton'
require_relative './scenes/scene'
require_relative './scenes/title'
require_relative './scenes/game'
require_relative './scenes/result'
require_relative './utility/button'
require_relative './utility/target'

$scale = 1.3
$font30 = Font.new(30*$scale)
$font60 = Font.new(60*$scale)
$font90 = Font.new(90*$scale)
Window.caption = "デジタル射的"
scene_manager = SceneManager.new()
Window.height = 480 * $scale
Window.width = 640 * $scale
Window.loop do
  scene_manager.do
end

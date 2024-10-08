require 'dxruby'
require 'singleton'
require_relative './scenes/scene'
require_relative './scenes/title'
require_relative './scenes/game'
require_relative './scenes/result'
require_relative './utility/button'
require_relative './utility/target'

$font30 = Font.new(30)
$font60 = Font.new(60)
$font90 = Font.new(90)
Window.caption = "デジタル射的"
scene_manager = SceneManager.new()

Window.loop do
  scene_manager.do
end

require 'ruby2d'

UNIT_SIZE = 20
MAP_WIDTH = 640
MAP_HEIGHT = 480
MAP_WIDTH_UNIT_NUM = MAP_WIDTH/UNIT_SIZE
MAP_HEIGHT_UNIT_NUM = MAP_HEIGHT/UNIT_SIZE

class Map
  def initialize
    Window.set(title: "Greedy Snake", MAP_WIDTH: 640, MAP_HEIGHT: 480)
    Window.set(background: 'navy')
  end
end
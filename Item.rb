require 'ruby2d'

class Item
  attr_accessor :item_position
  def initialize
    @item_position = [10, 10]
    @is_item_exist = false
  end

  def update
    draw_item
    detect_eat_item
  end

  def draw_item
    Square.new(x: $item.item_position[0] * UNIT_SIZE, y: $item.item_position[1] * UNIT_SIZE, size: UNIT_SIZE-1, color: 'red')
  end

  def generate_item
    $item.item_position[0] = rand(MAP_WIDTH_UNIT_NUM)
    $item.item_position[1] = rand(MAP_HEIGHT_UNIT_NUM)
  end

  def detect_eat_item
    if $player.position.last == $item.item_position
      $player.position.unshift($player.position.first)
      $game_rule.add_score
      generate_item
    end
  end
end

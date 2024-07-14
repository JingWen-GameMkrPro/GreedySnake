require 'ruby2d'

class Player
  attr_accessor :direction
  attr_accessor :position
  
  def initialize
    @direction = 'down'
    @position = [[5, 0], [5, 1], [5, 2], [5, 3]]
    @pre_generate_position = [-1,-1]
  end

  def update
    update_position
    draw_snake
  end

  def update_position
    $player.position.shift

    case @direction
    when  'up'
      $player.position.push([$player.position.last[0], $player.position.last[1] - 1])
      if($player.position.last[1] < 0)
        $player.position.last[1] = MAP_HEIGHT_UNIT_NUM
      end
    when  'down'
      $player.position.push([$player.position.last[0], $player.position.last[1] + 1])
      if($player.position.last[1] > MAP_HEIGHT_UNIT_NUM)
        $player.position.last[1] = 0
      end
    when  'right'
      $player.position.push([$player.position.last[0] + 1, $player.position.last[1]])
      if($player.position.last[0] > MAP_WIDTH_UNIT_NUM)
        $player.position.last[0] = 0
      end
    when  'left'
      $player.position.push([$player.position.last[0] - 1, $player.position.last[1]])
      if($player.position.last[0] < 0)
        $player.position.last[0] = MAP_WIDTH_UNIT_NUM
      end
    end
  end

  def draw_snake
    @position.each do |position|
      Square.new(x: position[0] * UNIT_SIZE, y: position[1] * UNIT_SIZE, size: UNIT_SIZE-1, color: 'white')
    end
  end
end

on :key_down do |event|
  if ['up', 'down', 'left', 'right'].include?(event.key)
    case $player.direction
    when  'up'
      if event.key != 'down'
        $player.direction = event.key
      end
    when  'down'
      if event.key != 'up'
        $player.direction = event.key
      end
    when  'right'
      if event.key != 'left'
        $player.direction = event.key
      end
    when  'left'
      if event.key != 'right'
        $player.direction = event.key
      end
    end
  elsif event.key == 'return'
    $game_rule.on_enter_down
  end
end
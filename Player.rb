require 'ruby2d'

SNAKE_UNIT_SIZE  = 20

class Player
  attr_accessor :direction
  attr_accessor :position
  def initialize
    @direction = 'down'
    @position = [[5, 0], [5, 1], [5, 2], [5, 3]]
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
    when  'down'
      $player.position.push([$player.position.last[0], $player.position.last[1] + 1])
    when  'right'
      $player.position.push([$player.position.last[0] + 1, $player.position.last[1]])
    when  'left'
      $player.position.push([$player.position.last[0] - 1, $player.position.last[1]])
    end
  end


  def draw_snake
    @position.each do |position|
      Square.new(x: position[0] * SNAKE_UNIT_SIZE, y: position[1] * SNAKE_UNIT_SIZE, size: SNAKE_UNIT_SIZE-1, color: 'white')
    end
  end

end

on :key_down do |event|
  if ['up', 'down', 'left', 'right'].include?(event.key)
    $player.direction = event.key
  elsif event.key == 'return'
    $game_rule.on_enter_down
  end
end
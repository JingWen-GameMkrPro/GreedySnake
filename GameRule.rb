require 'ruby2d'

class GameRule
  attr_accessor :game_state

  def initialize
    @game_state = 'wait'
  end

  def update
    detect_death
  end

  def detect_death
    unique_positions = $player.position.uniq
    if unique_positions != $player.position
      $game_rule.game_state = 'death'
    end
  end

  def on_enter_down
    case $game_rule.game_state
    when 'wait'
      start
    when 'playing'
      exit
    when 'death'
      restart
    end
  end

  def start
    $game_rule.game_state = 'playing'
  end

  def restart
    $main = Main.new
    start
  end

  def exit
    Window.close
  end
end
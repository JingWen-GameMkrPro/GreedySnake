require 'ruby2d'


class GameRule
  attr_accessor :game_state
  attr_accessor :score


  def initialize
    @game_state = 'wait'
    @score = 0
  end

  def update
    detect_death
  end

  def detect_death
    
    $player.position[0...-1].each do |element|
      if element == $player.position.last
        $game_rule.game_state = 'death'
        break
      end
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

  def add_score
    $game_rule.score = $game_rule.score + 1
  end
end
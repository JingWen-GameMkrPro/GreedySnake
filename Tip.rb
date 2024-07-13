require 'ruby2d'

WELCOME_TIP = 'Welcome to Greedy Snake ! (Press \'Enter\' to Start...)'
PLAYING_TIP = 'Score: ... (Press \'Enter\' to Exit...)'
DEATH_TIP = 'Game Over ! (Press \'Enter\' to Restart...)'
class Tip
  attr_accessor :current_tip

  def initialize
    @current_tip = WELCOME_TIP
  end

  def draw_tip
    change_tip
    Text.new(current_tip, color: "green", x: 10, y: 10, size: 18)
  end

  def change_tip
    case $game_rule.game_state
    when 'wait'
      $tip.current_tip = WELCOME_TIP
    when 'playing'
      $tip.current_tip = PLAYING_TIP
    when 'death'
      $tip.current_tip = DEATH_TIP
    end
  end
end
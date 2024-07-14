require 'ruby2d'



class Tip
  attr_accessor :current_tip

  def initialize
    @welcome_tip = 'Welcome to Greedy Snake ! (Press \'Enter\' to Start...)'
    @playing_tip = "Score: (#{$game_rule.score}) (Press \'Enter\' to Exit...)"
    @death_tip = 'Game Over ! (Press \'Enter\' to Restart...)'
    @current_tip = @welcome_tip
    @score_cache = $game_rule.score
  end

  def update
    detect_score
  end


  def detect_score
    if $game_rule.score != @score_cache
      @playing_tip = "Score: (#{$game_rule.score}) (Press \'Enter\' to Exit...)"
      @score_cache = $game_rule.score
    end
  end



  def draw_tip
    change_tip
    Text.new(current_tip, color: "green", x: 10, y: 10, size: 18)
  end

  def change_tip
    case $game_rule.game_state
    when 'wait'
      $tip.current_tip = @welcome_tip
    when 'playing'
      $tip.current_tip = @playing_tip
    when 'death'
      $tip.current_tip = @death_tip
    end
  end
end
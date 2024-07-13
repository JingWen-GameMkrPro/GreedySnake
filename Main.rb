require 'ruby2d'
require_relative 'Map'
require_relative 'Player'
require_relative 'GameRule'
require_relative 'Tip'

set fps_cap: 10

class Main
  def initialize
    @map = Map.new
    $player = Player.new
    $game_rule = GameRule.new
    $tip = Tip.new
  end

  def game_loop

    if $game_rule.game_state == 'playing'
      $game_rule.update
      $player.update
    end

    $tip.draw_tip
  end
end

$main = Main.new

update do
  clear
  $main.game_loop
end

show

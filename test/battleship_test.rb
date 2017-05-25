require './lib/battleship'
require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'

class BattleshipTest < Minitest::Test
  def test_if_it_launches_game
    x = Battleship.new
    assert_instance_of ReadBattleship, x
  end
end

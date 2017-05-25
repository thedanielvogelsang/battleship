require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/board'

class BoardTest < Minitest::Test

  def test_it_holds_hash
    instance = Board.new
    x = instance.board
    assert_instance_of Hash, x
  end

  def test_board_can_be_updated_to_M
    instance = Board.new
    instance.update("A1", "  M  ")
    grid_shot = instance.board["A1"]
    assert_equal "  M  ", grid_shot
  end

  def test_board_can_be_updated_to_H
    instance = Board.new
    instance.update("C1", "  H  ")
    grid_shot = instance.board["C1"]
    assert_equal "  H  ", grid_shot
  end

  def test_print
    instance = Board.new
    x = instance.print_me
    instance.update("C1", "  M  ")
    y = instance.print_me
    refute_equal x, y
  end

end

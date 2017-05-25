require 'minitest'
require 'minitest/pride'
require 'minitest/autorun'
require './lib/print_battleship'

class PrintTest < Minitest::Test

  def test_it_stores_2_boards_upon_initialization
    x = Printer.new
    result1 = x.person
    result2 = x.computer
    assert_instance_of Board, result1
    assert_instance_of Board, result2
  end

  def test_board_is_hash_of_gameboard
    x = Printer.new
    result1 = x.person.board
    assert_instance_of Hash, result1
  end

  def test_board_can_change_comps_board_on_update
    x = Printer.new
    x.update("computer", "A1", "MMM")
    result = x.computer.board
    assert_equal result["A1"], "MMM"
  end

  def test_board_can_change_persons_board_on_update
    x = Printer.new
    x.update("person", "C1", "MMM")
    result = x.person.board
    assert_equal result["C1"], "MMM"
  end

end

require "minitest"
require "minitest/autorun"
require "minitest/pride"
require "./lib/game_init"

class GameInitTest < Minitest::Test
  def test_it_cant_input_anything_but_B1_C1_syntax
    x = GameInit.new
    y = GameInit.new
    # insert ("A1A2") as first, ("A1 A2") as second
    four = x.scoordinates
    five = y.scoordinates
    assert_nil four
    assert_equal 1, four.length
  end

  def test_available_squares
    x = GameInit.new
    result = x.available_squares
    expected = ["A1", "A2", "A3", "A4", "B1", "B2", "B3", "B4", "C1", "C2", "C3", "C4", "D1", "D2", "D3", "D4"]
    assert_equal expected, result
  end

  def test_it_deletes_chosen_squares_from_board_placement_options
    skip
    x = GameInit.new
    #insert "A1A2" as coordinates
    expected = ["A3", "A4", "B1", "B2", "B3", "B4", "C1", "C2", "C3", "C4", "D1", "D2", "D3", "D4"]
    result = x.available_squares
    assert_equal expected, result
  end

  def test_it_puts_out_correct_options
    x = GameInit.new
    x = x.sub_placement_check(["A1", "A2"])
    expected = ["@1", "B1", "A0", "A2"]
    assert_equal expected, x
  end

  def test_shooter_class_holds_both_boats
    skip
    x = GameInit.new
    #enter A1 A2 for first, D1 D3 for second
    assert_instance_of Shooter
  end
end

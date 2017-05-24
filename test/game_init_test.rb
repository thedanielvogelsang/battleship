require "minitest"
require "minitest/autorun"
require "minitest/pride"
require "./lib/game_init"

class GameInitTest < Minitest::Test
  def test_it_stores_coordinates_the_same_4_vs_5_2_unit_boat
    skip
    x = GameInit.new
    y = GameInit.new
    # insert ("A1A2") as first, ("A1 A2") as second
    four = x.scoordinates
    five = y.scoordinates
    assert_equal four, five
  end

#consider deleting, because it no longer serves:
  # def test_available_squares
  #   x = GameInit.new
  #   result = x.available_squares
  #   expected = ["A1", "A2", "A3", "A4", "B1", "B2", "B3", "B4", "C1", "C2", "C3", "C4", "D1", "D2", "D3", "D4"]
  #   assert_equal expected, result
  # end

  def test_it_deletes_chosen_squares_from_board_placement_options
    skip
    x = GameInit.new
    #insert "A1A2" as coordinates
    expected = ["A3", "A4", "B1", "B2", "B3", "B4", "C1", "C2", "C3", "C4", "D1", "D2", "D3", "D4"]
    result = x.available_squares
    assert_equal expected, result
  end

  def test_it_puts_out_correct_options
    skip
    x = GameInit.new
    x = x.sub_placement_check(["A1", "A2"])
    expected = ["@1", "B1", "A0", "A2"]
    assert_equal expected, x
  end


  # def make_sad_tests_to_test_wrong_entries
  # end
end

require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require "./lib/eval_battleship"

class EvalTest < Minitest::Test
  def test_it_exists_as_a_module
    instance = Eval::Person.new
    instance2 = Eval::Computer.new
    assert_instance_of Eval::Person, instance
    assert_instance_of Eval::Computer, instance2
  end

  def test_computers_can_randomly_assign_boats
    instance = Eval::Computer.new
    instance.place_boats
    boat_coord = instance.boat_coordinates
    assert_equal 4, boat_coord.length
  end

end

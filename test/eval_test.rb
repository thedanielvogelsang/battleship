require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require "./lib/eval_battleship"

class EvalTest < Minitest::Test
  def test_it_exists_as_a_module
    instance = Eval::Person.new("arg1")
    instance2 = Eval::Computer.new
    assert_instance_of Eval::Person, instance
    assert_instance_of Eval::Computer, instance2
  end

  def test_computers_can_randomly_assign_boats
    instance = Eval::Computer.new
    instance.sub_boat_placement
    boat_coord = instance.comp_boat_coordinates
    assert_equal 1, boat_coord.length
  end

  def test_computer_can_randomly_assign_2_boats
    instance = Eval::Computer.new
    instance.sub_boat_placement
    instance.dest_boat_placement
    boat_coord = instance.comp_boat_coordinates
    assert_equal 2, boat_coord.length
  end

  def test_the_boats_dont_overlap
    instance = Eval::Computer.new
    instance.sub_boat_placement
    instance.dest_boat_placement
    instance2 = Eval::Computer.new
    instance2.sub_boat_placement
    instance2.dest_boat_placement
    instance3 = Eval::Computer.new
    instance3.sub_boat_placement
    instance3.dest_boat_placement
    instance4 = Eval::Computer.new
    instance4.sub_boat_placement
    instance4.dest_boat_placement
    one = instance.comp_boat_coordinates
    two = instance.comp_boat_coordinates
    three = instance.comp_boat_coordinates
    four = instance.comp_boat_coordinates
    assert_equal one, one.uniq
    assert_equal two, two.uniq
    assert_equal three, three.uniq
    assert_equal four, four.uniq
  end

  def test_it_does_the_same_with_place_boats_method
    instance = Eval::Computer.new
    instance.place_boats
    instance2 = Eval::Computer.new
    instance2.place_boats
    instance3 = Eval::Computer.new
    instance3.place_boats
    instance4 = Eval::Computer.new
    instance4.place_boats
    one = instance.comp_boat_coordinates
    two = instance.comp_boat_coordinates
    three = instance.comp_boat_coordinates
    four = instance.comp_boat_coordinates
    assert_equal one, one.uniq
    assert_equal two, two.uniq
    assert_equal three, three.uniq
    assert_equal four, four.uniq
  end
end

require 'minitest'
require 'minitest/pride'
require 'minitest/autorun'
require './lib/placement_check'

class PlacementTester < Minitest::Test

  def test_it_can_make_sub
    x = PlacementCheck::Sub.new(["D1", "D2"])
    assert_instance_of PlacementCheck::Sub, x
  end

  def test_it_can_make_destroyer
    x = PlacementCheck::Destroyer.new(["D1", "D3"])
    assert_instance_of PlacementCheck::Destroyer, x
  end

  def test_it_spits_out_appropriate_sub_secondary_options
    x = PlacementCheck::Sub.new(["D1", "D2"])
    y = x.possible_sub
    assert_equal ["CD2", "ED2", "D1-1", "D11"], y
  end

  def test_it_spits_out_appro_dest_secondary_options
    x = PlacementCheck::Destroyer.new(["D1", "D3"])
    y = x.possible_destroy
    assert_equal ["BD3", "FD3", "D1-2", "D12"], y
  end

end

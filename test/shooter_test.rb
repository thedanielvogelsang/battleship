require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/shooter'

class ShooterTest < Minitest::Test
  def test_instance_of_shooter
    x = Shooter.new([["arg1, arg2"], ["arg3", "arg4", "arg5"]],[["arg1, arg2"], ["arg3", "arg4", "arg5"]])
    assert_instance_of Shooter, x
  end

  def test_it_stores_boats_separately
    skip
    person = [["A1", "A2"], ["D1", "D2", "D3"]]
    c = [["A3", "A4"], ["C1", "C2", "C3"]]
    x = Shooter.new(c, person)
    psub_length = x.p_sub.length
    pdest_length = x.p_dest.length
    comp_length = x.comp_sub.length
    dest_length = x.comp_dest.length
    assert_equal 2, psub_length
    assert_equal 3, pdest_length
    assert_equal 2, comp_length
    assert_equal 3, dest_length
  end

  def test_player_can_fire_and_it_deletes_computer
    person = [["A1", "A2"], ["D1", "D2", "D3"]]
    c = [["A3", "A4"], ["C1", "C2", "C3"]]
    x = Shooter.new(c, person)
  end

  def test_person_fire_A1_and_A2_deletes_comp_sub
    skip
    x = Shooter.new
    x.person_fire
    #fire A1 then A2
    assert_nil @comp_sub
  end

  def test_person_fire_C1C2C3_deletes_comp_dest
    skip
    x = Shooter.new([["arg1, arg2"], ["arg3", "arg4", "arg5"]],[["arg1, arg2"], ["arg3", "arg4", "arg5"]])
    x.person_fire
    #fire C1C2C3
    assert_nil @dest_sub
  end

  def test_computer_can_play_to_the_end
    x = Shooter.new([["arg1, arg2"], ["arg3", "arg4", "arg5"]],[["arg1, arg2"], ["arg3", "arg4", "arg5"]])
  end
  
end

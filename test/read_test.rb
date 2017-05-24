require "minitest"
require "minitest/autorun"
require "minitest/pride"
require "./lib/read_battleship"

class ReaderTest < Minitest::Test
  def test_it_initiates_with_gets_chomp
    instance = ReadBattleship.new
    result = "Welcome to BATTLESHIP\n\nWould you like to (p)lay, read the (i)nstructions, or (q)uit?"
    assert_equal result, STDOUT
  end
end

#needs more tests :: make 4 total 

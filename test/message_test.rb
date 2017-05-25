require 'minitest'
require 'minitest/pride'
require 'minitest/autorun'
require './lib/messages'

class MessageTest < Minitest::Test
  def test_it_puts_strings
    x = Messages.new
    x = x.invalid
    assert_nil x
  end
end

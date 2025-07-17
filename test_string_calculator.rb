require 'minitest/autorun'
require_relative './string_calculator'

class StringCalculatorTest < Minitest::Test
  def test_empty_string_returns_0
    assert_equal 0, StringCalculator.add("")
  end

  def test_single_number_returns_itself
    assert_equal 5, StringCalculator.add("5")
  end
end
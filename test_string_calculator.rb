require 'minitest/autorun'
require_relative './string_calculator'

class StringCalculatorTest < Minitest::Test
  def test_empty_string_returns_0
    assert_equal 0, StringCalculator.add("")
  end

  def test_single_number_returns_itself
    assert_equal 5, StringCalculator.add("5")
  end

  def test_two_numbers_comma_delimited
    assert_equal 3, StringCalculator.add("1,2")
  end

  def test_any_amount_of_numbers
    numbers = (1..100).to_a.join(",")
    expected_total = (1..100).sum
    assert_equal expected_total, StringCalculator.add(numbers)
  end
end
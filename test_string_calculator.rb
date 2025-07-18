require 'minitest/autorun'
require_relative './string_calculator'

class StringCalculatorTest < Minitest::Test
  def test_empty_string_returns_0
    assert_equal 0, StringCalculator.add("")
  end

  def test_single_number_returns_itself
    assert_equal 1, StringCalculator.add("1")
  end

  def test_two_numbers_comma_delimited
    assert_equal 6, StringCalculator.add("1,5")
  end

  def test_any_amount_of_numbers
    numbers = (1..100).to_a.join(",")
    expected_total = (1..100).sum
    assert_equal expected_total, StringCalculator.add(numbers)
  end

  def test_new_line_between_numbers
    assert_equal 6, StringCalculator.add("1\n2,3")
  end

  def test_custom_delimiter
    assert_equal 3, StringCalculator.add("//;\n1;2")
  end

  def test_negative_numbers_raise_exception
    error = assert_raises(RuntimeError) { StringCalculator.add("1,-2,3,-4") }
    assert_equal "Negatives not allowed: -2,-4", error.message
  end

  def test_ignore_large_numbers
    assert_equal 2, StringCalculator.add("2,1001")
  end
end
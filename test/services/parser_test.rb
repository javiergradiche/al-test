require 'minitest/autorun'
require 'minitest/pride'
require './lib/parser.rb'

class ParserTest < Minitest::Test
  def test_parse_withour_imported
    parser = Parser.new
    result = parser.parse_line('2 book at 12.49')

    assert_equal 2, result.quantity
    assert_equal false, result.is_imported
    assert_equal 'book', result.name
    assert_equal 12.49, result.price_unit
  end

  def test_parse_with_imported
    parser = Parser.new
    result = parser.parse_line('1 imported box of chocolates at 10.00')

    assert_equal 1, result.quantity
    assert_equal true, result.is_imported
    assert_equal 'box of chocolates', result.name
    assert_equal 10.00, result.price_unit
  end
end

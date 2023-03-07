require 'minitest/autorun'
require 'minitest/pride'
require './lib/models/line_item.rb'

class LineItemTest < Minitest::Test
  def test_instance
    line_item = LineItem.new(
      {quantity: 2, is_imported: false, name: 'book', price_unit: 12.49 }
    )

    assert_equal 2, line_item.quantity
    assert_equal false, line_item.is_imported
    assert_equal 'book', line_item.name
    assert_equal 12.49, line_item.price_unit
  end
end

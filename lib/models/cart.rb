require './lib/models/line_item.rb'

class Cart
  def initialize(parser)
    @line_items = []
    @sales_taxes = 0
    @toal = 0
    @parser = parser
  end

  def add_line_item(item)
    @line_items.push(item)
    calculate_totals
  end

  def add_line_item_from_str(str_line_item)
    values = @parser.parse_line str_line_item
    line_item = LineItem.new values
    add_line_item line_item
  end

  def calculate_totals
    @sales_taxes = 0
    @total = 0
    @line_items.each do |line_item|
      line_item.calculate_taxes
      @sales_taxes += line_item.tax_sale
      @total += line_item.subtotal_with_taxes
    end
  end

  def to_s
    @line_items.each do |li|
      puts "#{li.quantity}#{li.is_imported ? ' imported':''} #{li.name}: #{'%.2f' % li.subtotal_with_taxes}"
    end
    puts "Sales Taxes: #{ '%.2f' % @sales_taxes }"
    puts "Total: #{ '%.2f' % @total }"
  end

  def count
    @line_items.size
  end
end
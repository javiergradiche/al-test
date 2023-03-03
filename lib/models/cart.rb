
class Cart
  attr_accessor :line_items, :sales_taxes, :total

  def initialize
    self.line_items = []
  end

  def add_line_item(item)
    line_items.push(item)
  end

  def refresh
    sales_taxes = 0
    total = 0
    line_items.each do |line_item|
      line_item.refresh_taxes
      sales_taxes += line_item.tax_sale
      total += line_item.subtotal_with_taxes
    end
  end

  def to_s
    line_items.each do |li|
      puts "#{li.quantity}#{li.is_imported? ' imported':''} #{li.name}: #{li.price_with_taxes}"
    end
    puts "Sales Taxes: #{self.sales_taxes}"
    puts "Total: #{self.total}"
  end
end
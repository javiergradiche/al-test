class Parser
  attr_accessor :quantity, :is_imported, :name, :price_unit

  def parse_line(str_line)

    # TODO: Make the parser using regex
    self.quantity =  str_line.split(' ')[0].to_i
    str_wo_quantity = str_line.split(' ').drop(1).join(" ")
    self.is_imported = str_wo_quantity.include? 'imported'
    self.price_unit =  str_wo_quantity.split(' at ')[-1].to_f
    str_wo_quantity.slice!('imported ')
    self.name = str_wo_quantity.split(' at')[0]
    self
  end

end
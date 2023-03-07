class Parser
  LineItemStruct = Struct.new(:quantity, :is_imported, :name, :price_unit)

  def parse_line(str_line)
    # TODO: Make the parser using regex
    li = LineItemStruct.new()
    li.quantity =  str_line.split(' ')[0].to_i
    str_wo_quantity = str_line.split(' ').drop(1).join(" ")
    li.is_imported = str_wo_quantity.include? 'imported'
    li.price_unit =  str_wo_quantity.split(' at ')[-1].to_f
    str_wo_quantity.slice!('imported ')
    li.name = str_wo_quantity.split(' at')[0]
    li
  end
end

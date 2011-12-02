xml.Row do
  empty_cells.times do
    xml.Cell
  end
  xml.Cell do
    xml.Data "ID", 'ss:Type'=>'String'
  end
  xml.Cell do
    xml.Data "Recorded On", 'ss:Type'=>'String'
  end
  xml.Cell do
    xml.Data "Duration", 'ss:Type'=>'String'
  end
  xml.Cell do
    xml.Data "Note", 'ss:Type'=>'String'
  end
  xml.Cell do
    xml.Data "Tags", 'ss:Type'=>'String'
  end
end


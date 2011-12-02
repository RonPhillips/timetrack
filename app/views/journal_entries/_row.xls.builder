#def fake
xml.Row do
  empty_cells.times do
    xml.Cell
  end
  xml.Cell do
    xml.Data journal_entry.id, 'ss:Type'=>'Number'
  end
  xml.Cell 'ss:StyleID'=>"date" do
    xml.Data fmt_ss_date(journal_entry.recorded_on), 'ss:Type'=>'DateTime'
  end
  xml.Cell do
    xml.Data journal_entry.duration, 'ss:Type'=>'Number'
  end
  xml.Cell do
    xml.Data journal_entry.note, 'ss:Type'=>'String'
  end
  xml.Cell do
    xml.Data journal_entry.tagstring, 'ss:Type'=>'String'
  end
end
#end

xml.instruct! :xml, :version=>"1.0", :encoding=>"UTF-8"

workbook_xmlns = {
  'xmlns'      => "urn:schemas-microsoft-com:office:spreadsheet",
  'xmlns:o'    => "urn:schemas-microsoft-com:office:office",
  'xmlns:x'    => "urn:schemas-microsoft-com:office:excel",
  'xmlns:html' => "http://www.w3.org/TR/REC-html40",
  'xmlns:ss'   => "urn:schemas-microsoft-com:office:spreadsheet"
}

xml.Workbook(workbook_xmlns) do
  xml << render(:partial => 'reports/styles')
  
  xml.DocumentProperties({'xmlns' => "urn:schemas-microsoft-com:office:office"}) do
    xml.Author current_user.employee.id unless (!current_user)
    xml.Created Time.now
    xml.Company 'Summit County Engineer'
    xml.Title request.url.html_safe
  end
  
  xml.Worksheet 'ss:Name' => 'Journal Entries Search Results' do
    
    xml.Table do
      # Header
      xml.Row do
        xml.Cell 'ss:StyleID'=>'project'  do
          xml.Data 'Journal Entries Search Results', 'ss:Type' => 'String'
        end
      end
      xml.Row do
        xml.Cell'ss:StyleID'=>'project'  do
          xml.Data 'TERMS:', 'ss:Type' => 'String'
        end
        xml.Cell 'ss:StyleID'=>'project'  do
          xml.Data @raw_search, 'ss:Type' => 'String'
        end

      end
      xml.Row do
        xml.Cell'ss:StyleID'=>'project'  do
          xml.Data 'PERMALINK:', 'ss:Type' => 'String'
        end

        xml.Cell 'ss:StyleID'=>'project'  do
          xml.Data request.url.html_safe, 'ss:Type' => 'String'
        end
      end
      #Journal Entries
      xml << render(
          :partial=>'table_header', 
          :locals=>{:empty_cells=>0, :style=>'allocation_headers'}
      )
      for journal_entry in @journal_entries
        xml << render(
                :partial=>'row', 
                :locals=>{:journal_entry=>journal_entry,:empty_cells=>0}
        )
      end
    end
  end
end

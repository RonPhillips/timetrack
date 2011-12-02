  xml.Styles do
    xml.Style 'ss:ID' => 'date' do
      xml.NumberFormat 'ss:Format' => 'mm\/dd\/yyyy'
      xml.Font 'ss:Color'=>'#808000'
    end
    xml.Style 'ss:ID' => 'title' do
      xml.NumberFormat 'ss:Format' => '#,##0.00\ [$€]'
      xml.Font 'ss:Family'=>'Swiss', 'ss:Color'=>'#008080', 'ss:Bold'=>'1'#, 'ss:Size'=>'16'
    end
    xml.Style 'ss:ID'=>'currency' do
      xml.NumberFormat 'ss:Format'=>'$#0.00'
    end
    xml.Style 'ss:ID'=>'bool' do
      xml.NumberFormat 'ss:Format'=>'Yes/No'
    end
    xml.Style 'ss:ID' => 'project' do
      xml.Font 'ss:Family'=>'Swiss', 'ss:Color'=>'#008080', 'ss:Bold'=>'1'#, 'ss:Size'=>'16'
    end
    xml.Style 'ss:ID' => 'project_headers' do
      xml.Font 'ss:Family'=>'Swiss', 'ss:Color'=>'#008080', 'ss:Bold'=>'1'#, 'ss:Size'=>'14'
    end
    xml.Style 'ss:ID' => 'allocation' do
      xml.Font 'ss:Family'=>'Swiss', 'ss:Color'=>'#808000', 'ss:Bold'=>'1'#, 'ss:Size'=>'14'
    end
    xml.Style 'ss:ID' => 'allocation_headers' do
      xml.Font 'ss:Family'=>'Swiss', 'ss:Color'=>'#808000', 'ss:Bold'=>'1'#, 'ss:Size'=>'14'
    end
    xml.Style 'ss:ID' => 'task' do
      xml.Font 'ss:Family'=>'Swiss', 'ss:Color'=>'#800080', 'ss:Bold'=>'1'#, 'ss:Size'=>'12'
    end
    xml.Style 'ss:ID' => 'task_headers' do
      xml.Font 'ss:Family'=>'Swiss', 'ss:Color'=>'#800080', 'ss:Bold'=>'1'#, 'ss:Size'=>'12'
    end
    
  end

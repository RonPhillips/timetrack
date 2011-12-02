class Report 
  
  attr_accessor  :title, :data, :columns, :start_date, :through_date, :detail_level,:subject,:current_row, :workbook, :worksheet
  
  #DETAIL_LEVELS= %w(project allocation task task_detail)
  #SUBJECTS= %w(project allocation tag person date) 
  
  def initialize(title)
    @title = title
  end
  
end
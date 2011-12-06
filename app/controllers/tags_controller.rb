class TagsController < ApplicationController

  respond_to :xml, :xls, :json
  
  def index
    @q = Tag.search(params[:q])
    @tags = @q.result(:distinct=>true)
    params[:q].nil? ? @raw_search = 'All' : @raw_search=params[:q].to_s
    respond_to do |format|
      format.html
      format.xml do
        render :xml => @q.result(:distinct=>true).to_xml(:dasherize => false) 
      end
      format.json do
        render :json=>@q.result(:distinct=>true).to_json, :layout => false
      end
    end
  end


  def remove
    @task = Task.find(params[:task_id])
    if can?(:tag, @task.project) || current_user.admin?
      @tag = Tag.find(params[:id])
      @task.tags -= [@tag]
      @task.save
      #render :nothing => true
    end
  end

  def untag
    @journal_entry = JournalEntry.find(params[:journal_entry_id])
    #if can?(:tag, @task.project) || current_user.admin?
      @tag = Tag.find(params[:id])
      @journal_entry.tags -= [@tag]
      @journal_entry.save
      #render :nothing => true
      redirect_to @journal_entry
    #end
  end

end

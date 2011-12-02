class JournalEntriesController < ApplicationController
  before_filter :find_journal_entry, :only=>[:show, :edit, :update, :destroy]
  respond_to :xml, :xls, :json
  def index
    @q = JournalEntry.search(params[:q])
    @journal_entries = @q.result(:distinct=>true)
    params[:q].nil? ? @raw_search = 'All' : @raw_search=params[:q].to_s
    respond_to do |format|
      format.html
      format.xml do
        render :xml => @q.result(:distinct=>true).to_xml(:dasherize => false) 
      end
      format.xls do
        render :layout => false
        headers['Content-Disposition'] = "attachment; filename=\"journal_entries_search#{depunctuate(@raw_search).downcase}_#{fmt_file_date(Time.new)}.xls\""
        headers['Cache-Control'] = ''
      end
    end
  end
  
  def show

  end
  
  def new
    @journal_entry=JournalEntry.new
  end
  
  def create
    @journal_entry = JournalEntry.new(params[:journal_entry])
    if @journal_entry.save
      @journal_entry.tag!(params[:tags]) #if params[:tags]
      flash[:notice] = "Journal Entry has been created."
      redirect_to @journal_entry
    else
      flash[:alert] = "Journal Entry has not been created."
      render :action => 'new'
    end
  end
  
  def edit
  end

  def update
    if @journal_entry.update_attributes(params[:journal_entry])
      @journal_entry.tag!(params[:tags]) #if params[:tags]
      flash[:notice] = "Journal Entry has been updated."
      redirect_to @journal_entry
    else
      flash[:alert] = "Journal Entry has not been updated."
      render :action => "edit"
    end
  end
  
  def destroy
    @journal_entry.destroy
    flash[:notice] = "Journal Entry has been deleted."
    redirect_to journal_entries_path
  end

  private
  def find_journal_entry
    @journal_entry = JournalEntry.find(params[:id])
    rescue ActiveRecord::RecordNotFound
    flash[:alert] = "The journal entry you were looking" +
    " for could not be found."
    redirect_to journal_entries_path
  end


end

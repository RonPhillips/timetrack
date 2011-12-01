class JournalEntriesController < ApplicationController
  before_filter :find_journal_entry, :only=>[:show, :edit, :update, :destroy]
  
  def index
    @q = JournalEntry.search(params[:q])
    @journal_entries = @q.result(:distinct=>true)
  end
  def search
    index
    render :index
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

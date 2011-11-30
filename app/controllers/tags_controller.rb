class TagsController < ApplicationController

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

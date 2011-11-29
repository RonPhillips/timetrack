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

end

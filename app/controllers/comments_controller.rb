class CommentsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_task

  def create
    if cannot?(:"change states", @task.project)
      params[:comment].delete(:state_id)
    end
    @comment = @task.comments.build(params[:comment].merge(:user => current_user))
    if @comment.save
      if can?(:tag, @task.project) || current_user.admin?
        @task.tag!(params[:tags])
      end
      flash[:notice] = "Comment has been created."
      redirect_to [@task.project, @task]
    else
      @states = State.all
      flash[:alert] = "Comment has not been created."
      render :template => "tasks/show"
    end
  end

  private
  
  def find_task
    @task = Task.find(params[:task_id])
  end

end



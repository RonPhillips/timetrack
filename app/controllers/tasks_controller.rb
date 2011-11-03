class TasksController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]
  before_filter :find_project
  before_filter :find_task, :only=> [:show, :edit, :update, :destroy]

  def show
  
  end
  
  def new
    @task = @project.tasks.build
  end
  
  def create
    @task = @project.tasks.build(params[:task].merge!(:user => current_user))
    if @task.save
      flash[:notice] = "Task has been created."
      redirect_to [@project, @task]
    else
      flash[:alert] = "Task has not been created."
      render :action => "new"
    end
  end
  
  def edit
  
  end

  def update
    if @task.update_attributes(params[:task])
      flash[:notice] = "Task has been updated."
      redirect_to [@project, @task]
    else
      flash[:alert] = "Task has not been updated."
      render :action => "edit"
    end
  end

  def destroy
    @task.destroy
    flash[:notice] = "Task has been deleted."
    redirect_to @project
  end

  private
  
  def find_project
    @project = Project.find(params[:project_id])
  end 
  def find_task
    @task = @project.tasks.find(params[:id])
  end 
end

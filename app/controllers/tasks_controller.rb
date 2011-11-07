class TasksController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_project
  before_filter :find_task, :only=> [:show, :edit, :update, :destroy]
  before_filter :authorize_create!, :only => [:new, :create]
  
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
  
  def authorize_create!
    if !current_user.admin? && cannot?("create tasks".to_sym, @project)
    flash[:alert] = "You cannot create tasks on this project."
    redirect_to @project
    end
  end

  def find_project
    @project = Project.for(current_user).find(params[:project_id])
    rescue ActiveRecord::RecordNotFound
    flash[:alert] = "The project you were looking for could not be found."
    redirect_to root_path
  end
   
  def find_task
    @task = @project.tasks.find(params[:id])
  end 
end

class TasksController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_project
  before_filter :find_task, :only=> [:show, :edit, :update, :destroy]
  before_filter :authorize_create!, :only => [:new, :create]
  before_filter :authorize_update!, :only => [:edit, :update]
  before_filter :authorize_delete!, :only => [:destroy]
  
#  def index
#    @q = Task.search(params[:q])
#    @tasks = @q.result()
#    render @project
#  end
  
  def search
    @q = Task.search(params[:q])
    @tasks = @q.result()
    render 'projects/show'
  end
  
  def show
    @comment = @task.comments.build
    @states = State.all
  end
  
  def new
    @task = @project.tasks.build
  end
  
  def create
    @task = @project.tasks.build(params[:task].merge!(:user => current_user))
    if @task.save
      if can?(:tag, @project) || current_user.admin?
        @task.tag!(params[:tags])
      end
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

  def authorize_update!
    if !current_user.admin? && cannot?(:"edit tasks", @project)
      flash[:alert] = "You cannot edit tasks on this project."
      redirect_to @project
    end
  end
  
  def authorize_delete!
    if !current_user.admin? && cannot?(:"delete tasks", @project)
      flash[:alert] = "You cannot delete tasks from this project."
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

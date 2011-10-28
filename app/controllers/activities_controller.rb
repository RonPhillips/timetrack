class ActivitiesController < ApplicationController
  before_filter :find_activity, :only=>[:show, :edit, :update, :destroy]
  def index
    @activities = Activity.all
  end
  def show

  end
  def new
    @activity = Activity.new
  end
  def create
    @activity = Activity.new(params[:activity])
    if @activity.save
      flash[:notice] = "Activity has been created."
      redirect_to @activity
    else
      flash[:alert] = "Activity has not been created."
      render :action => 'new'
    end
  end
  def edit

  end
  def update
    if @activity.update_attributes(params[:activity])
      flash[:notice] = "Activity has been updated."
      redirect_to @activity
    else
      flash[:alert] = "Activity has not been updated."
      render :action => "edit"
    end
  end
  def destroy
    @activity.destroy
    flash[:notice] = "Activity has been deleted."
    redirect_to activities_path
  end
  
  private
  
  def find_activity
    @activity = Activity.find(params[:id])
    rescue ActiveRecord::RecordNotFound
    flash[:alert] = "The activity you were looking" +
    " for could not be found."
    redirect_to activities_path
  end

end

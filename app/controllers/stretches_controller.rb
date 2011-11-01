class StretchesController < ApplicationController
  before_filter :find_stretch, :only=>[:show, :edit, :update, :destroy]
  
  def index
    @stretches = Stretch.all
  end
  
  def show

  end
  
  def new
    @stretch=Stretch.new
  end
  
  def create
    @stretch = Stretch.new(params[:stretch])
    if @stretch.save
      flash[:notice] = "Stretch has been created."
      redirect_to @stretch
    else
      flash[:alert] = "Stretch has not been created."
      render :action => 'new'
    end
  end
  
  def edit
  end

  def update
    if @stretch.update_attributes(params[:stretch])
      flash[:notice] = "Stretch has been updated."
      redirect_to @stretch
    else
      flash[:alert] = "Stretch has not been updated."
      render :action => "edit"
    end
  end
  
  def destroy
    @stretch.destroy
    flash[:notice] = "Stretch has been deleted."
    redirect_to stretches_path
  end

  private
  def find_stretch
    @stretch = Stretch.find(params[:id])
    rescue ActiveRecord::RecordNotFound
    flash[:alert] = "The stretch you were looking" +
    " for could not be found."
    redirect_to stretches_path
  end


end

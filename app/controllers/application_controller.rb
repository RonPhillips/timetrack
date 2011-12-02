class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :find_states
  respond_to :xml, :xls, :json
  private
  
  def authorize_admin!
    authenticate_user!
    unless current_user.admin?
      flash[:alert] = "You must be an admin to do that."
      redirect_to root_path
    end
  end
  
  def find_states
    @states = State.all
  end
    
  def depunctuate(some_string)
    out=''
    out = some_string.gsub(/[^a-zA-Z0-9]/, '_');
    out = out.gsub(/ _|_ /, ' ')
    out.squeeze!('_')
    out.chomp!('_')
    return out
  end
  
  def fmt_file_date(the_date)
    out = the_date.strftime('%Y_%m_%d')
    return out
  end

end

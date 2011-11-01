require 'spec_helper'

describe StretchesController do
  it "displays an error for a missing stretch" do
    get :show, :id => "not-here"
    response.should redirect_to(stretches_path)
    message = "The stretch you were looking for could not be found."
    flash[:alert].should eql(message)
  end
end


require 'spec_helper'

describe JournalEntriesController do
  it "displays an error for a missing journal entry" do
    get :show, :id => "not-here"
    response.should redirect_to(journal_entries_path)
    message = "The journal entry you were looking for could not be found."
    flash[:alert].should eql(message)
  end
end


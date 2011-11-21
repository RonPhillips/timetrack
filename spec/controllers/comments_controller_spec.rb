require 'spec_helper'

describe CommentsController do
  let(:user) { create_user! }
  let(:project) { Project.create!(:name => "Timetracker") }
  let(:task) do
    project.tasks.create(:title => "State transitions",
          :description => "Can't be hacked.",
          :user => user)
  end
  
  let(:state) { State.create!(:name => "New") }
  
  context "a user without permission to set state" do
    before do
      sign_in(:user, user)
    end
    it "cannot transition a state by passing through state_id" do
      post :create, { :comment => { :text => "Hacked!",
      :state_id => state.id },
      :task_id => task.id }
      task.reload
      task.state.should eql(nil)
    end
  end

  
end



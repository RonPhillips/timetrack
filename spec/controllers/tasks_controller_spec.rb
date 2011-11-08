require 'spec_helper'

describe TasksController do
  let(:user) { create_user! }
  let(:project) { Factory(:project) }
  let(:task) { Factory(:task, :project => project,
  :user => user) }
  context "standard users" do
    
    it "cannot access a task for a project" do
      sign_in(:user, user)
      get :show, :id => task.id, :project_id => project.id
      response.should redirect_to(root_path)
      flash[:alert].should eql("The project you were looking for could not be found.")
    end
    
    context "with permission to view the project" do
      before do
        sign_in(:user, user)
        Permission.create!(:user => user, :permissions_apply => project, :action => "view")
      end
      
      def cannot_create_tasks!
        response.should redirect_to(project)
        flash[:alert].should eql("You cannot create tasks on this project.")
      end
      def cannot_update_tasks!
        response.should redirect_to(project)
        flash[:alert].should eql("You cannot edit tasks on this project.")
      end
      
      it "cannot begin to create a task" do
        get :new, :project_id => project.id
        cannot_create_tasks!
      end
      it "cannot create a task without permission" do
        post :create, :project_id => project.id
        cannot_create_tasks!
      end
      
      it "cannot edit a task without permission" do
        get :edit, { :project_id => project.id, :id => task.id }
        cannot_update_tasks!
      end
      
      it "cannot update a task without permission" do
        put :update, { :project_id => project.id,
        :id => task.id,
        :task => {}
        }
        cannot_update_tasks!
      end
    end 
    
  end
end



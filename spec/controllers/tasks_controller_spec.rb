require 'spec_helper'

describe TasksController do
  describe "creating a task" do
    describe "not signed in" do
      it "should deny access" do
        get :new
        response.should redirect_to root_path
      end
      
      it "should display a flash message" do
        get :new
        flash[:notice].should == "Please log in to perform this action"
      end
    end
    
    describe "signed in" do
      before(:each) do
        @user = FactoryGirl.create(:user)
        sign_in @user
      end
      
      it "should allow access" do
        get :new
        response.should be_success
      end
      
      it "should display the new task form" do
        get :new
        response.body.should have_selector('h1', :text => "Create a task")
      end
    end
  end
end
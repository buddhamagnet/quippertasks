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
        flash[:notice].should == "Please log in to create a task"
      end
    end
    
    describe "signed in" do
      before(:each) do
        sign_in @user
      end
    end
  end
end
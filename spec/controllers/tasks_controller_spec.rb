require 'spec_helper'

describe TasksController do
  describe "creating a task" do
    describe "not signed in" do
      it "should deny access" do
        get :new
        response.should redirect_to root_path
      end
    end
    
    describe "signed in" do
      
    end
  end

end

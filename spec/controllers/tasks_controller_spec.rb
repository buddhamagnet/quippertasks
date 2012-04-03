require 'spec_helper'

describe TasksController do
  
  describe "tasks index" do
    describe "not signed in" do
      it "should deny access" do
        get :index
        response.should redirect_to root_path  
      end  
    end
    
    describe "signed in" do
      before(:each) do
        @user = FactoryGirl.create(:user)
        sign_in @user
      end
      
      it "should display a list of tasks" do
        get :index
        response.should be_success
        response.body.should have_css("table.task_list")
      end
    end
  end
  
  describe "show task" do
    before(:each) do
      @task = FactoryGirl.create(:task)
    end
    
    describe "not signed in" do
      it "should deny access" do
        get :show, :id => @task
        response.should redirect_to root_path
      end
    end
    
    describe "signed in" do
      before(:each) do
        @user = FactoryGirl.create(:user, :email => Factory.next(:email))
        sign_in @user
      end
      
      it "should show the task" do
        get :show, :id => @task
        response.should be_success
      end
    end
  end
  
  describe "new task" do
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
        response.body.should have_selector('legend', :text => "New Task")
      end
    end
  end
  
  describe "create task" do
    before(:each) do
      @user = FactoryGirl.create(:user, :email => Factory.next(:email))
      @attr = { :name => "test task", :description => "Just a test", :deadline => Time.now }
      sign_in @user
    end
    
    it "should create a new task" do
      lambda do
        post :create, :task => @attr
      end.should change(Task, :count).by(1)
    end
    
    it "should require a name" do
      lambda do
        post :create, :task => @attr.merge!(:name => "")
      end.should_not change(Task, :count)
    end
      
    it "should require a description" do
      lambda do
        post :create, :task => @attr.merge!(:description => "")
      end.should_not change(Task, :count)
    end
    
    it "should require a deadline" do
      lambda do
        post :create, :task => @attr.merge!(:deadline => "")
      end.should_not change(Task, :count)
    end
  
  end
end
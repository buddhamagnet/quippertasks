require 'spec_helper'

describe TasksController do
  
  render_views
  
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
        response.body.should have_css("table.task-list")
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
  
  describe "edit a task" do
    describe "not signed in" do
      before(:each) do
        @user = FactoryGirl.create(:user, :email => Factory.next(:email))
        @task = FactoryGirl.create(:task)
      end
      
      it "should deny access" do
        get :edit, :id => @task.id
        response.should redirect_to root_path
      end
    end
    
    describe "signed in" do
      before(:each) do
        @user = FactoryGirl.create(:user, :email => Factory.next(:email))
        sign_in @user
        @task = FactoryGirl.create(:task)
      end
      
      it "should display the edit page" do
        get :edit, :id => @task.id
        response.should be_success
      end
    end    
  end
  
  describe "update a task" do
    describe "not signed in" do
      before(:each) do
        @user = FactoryGirl.create(:user, :email => Factory.next(:email))
        @task = FactoryGirl.create(:task)
      end

      it "should deny access" do
        put :update, :id => @task.id, :task => @attr
        response.should redirect_to root_path
      end 
    end
    
    describe "signed in" do
      before(:each) do
        @user = FactoryGirl.create(:user, :email => Factory.next(:email))
        sign_in @user
        @task = FactoryGirl.create(:task)
        @attr = { :name => "Updated task", :description => "I have been updated", :deadline => Date.today }
      end

      it "should update the task" do
        put :update, :id => @task.id, :task => @attr
        response.should redirect_to tasks_path
      end 
      
      it "should be marked as completed" do
        put :update, :id => @task.id, :task => @attr.merge!(:completed => true)
        @task.reload
        @task.should be_completed
      end
    end
  end
  
  describe "tasks that missed deadline" do
    before(:each) do
      @user = FactoryGirl.create(:user, :email => Factory.next(:email))
      sign_in @user
      @user.tasks << FactoryGirl.create(:task, :deadline => Date.today)
    end
    
    it "should not display any tasks if no deadlines have been missed" do
      get :expired
      response.body.should have_selector("h1", :text => "No tasks currently expired")
    end
    
    it "should display a task that has missed the deadline" do
      Timecop.freeze(Date.today + 30)
      get :expired
      response.body.should have_selector("h1", :text => "Expired Tasks")
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
      @attr = { :name => "test task", :description => "Just a test", :deadline => Date.today }
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
  
  describe "delete task" do
    before(:each) do
      @user = FactoryGirl.create(:user, :email => Factory.next(:email))
      sign_in @user
      @task = FactoryGirl.create(:task)
      @user.tasks << @task
    end
      
    it "should delete the task" do
      lambda do
        delete :destroy, :id => @task
      end.should change(Task, :count).by(-1)
    end
    
    it "should decrement the user tasks array" do
      delete :destroy, :id => @task
      @user.tasks.count.should == 0
    end
    
    it "should redirect to the task page" do
      delete :destroy, :id => @task
      response.should redirect_to tasks_path
    end
  end
end
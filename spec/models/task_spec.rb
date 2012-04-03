require 'spec_helper'

describe Task do
  before(:each) do
    @task = Task.new
  end
  
  describe "task attributes" do
    it "should have a deadline" do
      @task.should respond_to(:deadline)
    end
    
    it "should have a completed state" do
      @task.should respond_to(:completed)
    end
  end
  
  describe "task assocations" do
    it "should have a user method" do
      @task.should respond_to(:user)
    end
  end
  
  describe "task validations" do
    it "should require a name" do
      Task.new(:name => '', :description => "I am the task with no name").should_not be_valid
    end
    
    it "should require a description" do
      Task.new(:name => 'Test task', :description => '').should_not be_valid
    end
  end
end
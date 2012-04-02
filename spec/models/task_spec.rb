require 'spec_helper'

describe Task do
  before(:each) do
    @task = Task.new
  end
  
  describe "task assocations" do
    it "should have a user method" do
      @task.should respond_to(:user)
    end
  end
end

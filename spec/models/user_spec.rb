require 'spec_helper'

describe User do
  before(:each) do
    @user = User.new
  end
  
  describe "user associations" do
    it "should have a tasks method" do
      @user.should respond_to(:tasks)
    end
  end
end

class TasksController < ApplicationController
  before_filter :authenticate
  
  def new
    @task = Task.new
  end
end

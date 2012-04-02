class TasksController < ApplicationController
  before_filter :authenticate
  
  def index
    @tasks = current_user.tasks
  end
  
  def new
    @task = Task.new
  end
  
  def create
    @task = current_user.tasks.build(params[:task])
    if @task.save
      redirect_to tasks_path, :notice => "Task was created"
    else
      render 'new'
    end
  end
end

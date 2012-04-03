class TasksController < ApplicationController
  before_filter :authenticate
  
  def index
    @tasks = current_user.tasks
  end
  
  def show
    @task = Task.find(params[:id])
  end
  
  def new
    @task = Task.new
  end
  
  def edit
    @task = Task.find(params[:id])
  end
  
  def update
    @task = Task.find(params[:id])
    if @task.update_attributes(params[:task])
      flash[:success] = "Task updated"
      redirect_to tasks_path
    else
      flash[:notice] = "Task not updated"
      render 'edit'
    end
  end
  
  def create
    @task = current_user.tasks.build(params[:task])
    if @task.save
      redirect_to tasks_path, :notice => "Task was created"
    else
      render 'new'
    end
  end
  
  def destroy
    Task.find_by_id(params[:id]).destroy
    flash[:notice] = "Task has been deleted"
    redirect_to tasks_path
  end
  
  def expired
    @tasks = Task.expired
  end
end

class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    # RETRIEVE SPECIFIC TASK
    @task = Task.find(params[:id])
  end

  # THE EMPTY RESTAURANT THAT WILL BE USED TO INSTANTIATE THE FORM
  def new
    @task = Task.new
  end

  def create
    task = Task.new(task_params)
    task.save
    # doesn't have a view so we redirect_to "/tasks/#{task.id}"
    # Reformat "/tasks/#{task.id}" to task_path(task) by renaming in routes.rb
    redirect_to task_path(task)
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    task = Task.find(params[:id])
    task.update(task_params)
    # doesn't have a view so we redirect_to tasks_path
    redirect_to tasks_path
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path
  end

  private

  # ADDING STRONG PARAMS FOR CREATE
  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end

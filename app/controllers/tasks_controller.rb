class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
    @message = "it's completed" if @task.completed
    @message = "it's not completed" if @task.completed == false
  end

  def new
    @new_task = Task.new
  end

  def create
    new_task = Task.new(task_params) #takes a hash of title and description, permit only what i want to take
      if new_task.save
        redirect_to tasks_path
      end
  end

  def edit
    @the_task = Task.find(params[:id])
  end

  def update
    the_task = Task.find(params[:id])
    @message = "The task is completed" if the_task.completed
    @message = "The task is not completed" if the_task.completed == false
    the_task.update(task_params)
    redirect_to task_path(the_task)
  end

  def destroy
    the_task = Task.find(params[:id])
    if the_task.destroy
      redirect_to tasks_path
    end
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end

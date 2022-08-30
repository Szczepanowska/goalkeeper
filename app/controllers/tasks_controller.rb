class TasksController < ApplicationController
  before_action :find_goal, only: [:create, :update, :destroy]
  before_action :find_task, only: [:create, :edit, :update, :destroy]
  def new
    @task = Task.new
  end

  def create
    if @task.save
      redirect_to goal_path(@goal)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to goal_path(@goal)
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to goal_path(@goal)
  end

  private

  def find_goal
    @goal = Goal.find(params[:id])
  end

  def find_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:name, :description, :status)
  end
end

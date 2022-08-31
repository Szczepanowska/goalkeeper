class TasksController < ApplicationController
  before_action :find_goal, only: [:update]
  before_action :find_task, only: [:edit, :update]
  def new
    @goal = Goal.find(params[:goal_id])
    @task = Task.new
  end

  def create
    @goal = Goal.find(params[:goal_id])
    @task = Task.new(task_params)
    @task.goal = @goal
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
    @task = Task.find(params[:goal_id])
    @task.destroy
    redirect_to goal_path(@task.goal_id), status: :see_other
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

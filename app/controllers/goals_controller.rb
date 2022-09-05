class GoalsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :show ]
  before_action :set_goal, only: [:show, :edit, :update, :destroy]

  def index
    @goals = policy_scope(Goal)
    complete_goals(@goals)
    @user_goals = current_user.goals
    @tasks = Task.find_by(goal_id: @goals)

    @user_completed_goals = @goals.where(status: "completed")
  end

  def show
    authorize @goal
    @task = Task.new(goal: @goal)
    @like = Like.find_by(user: current_user, goal: @goal)
  end

  def new
    @goal = Goal.new
    authorize @goal
  end

  def create
    @goal = Goal.new(goal_params)
    authorize @goal
    @goal.user = current_user
    if @goal.save
      redirect_to goals_path
    else
      render :new
    end
  end

  def edit
    authorize @goal
  end

  def update
    authorize @goal
    if @goal.update(goal_params)
      redirect_to goals_path
    else
      render :edit
    end
  end

  def destroy
    authorize @goal
    @goal.destroy
    redirect_to goals_path, status: :see_other
  end

  private

  def complete_goals(goals)
    goals.each do |goal|
      goal.update(status: "completed") if goal.progress == 1.0
    end
  end

  def set_goal
    @goal = Goal.find(params[:id])
  end

  def goal_params
    params.require(:goal).permit(:name, :description, :category, :start_date, :end_date)
  end
end

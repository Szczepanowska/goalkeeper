class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]
  def home
    if params[:query].present?
      @goals = Goal.where("name ILIKE ?", "%#{params[:query]}%")
    elsif params[:name].present?
      @goals = Goal.where(category: params[:name][:category])
    else
      @goals = Goal.where("user_id != #{current_user.id}")
    end
    @goals.order(updated_at: :desc)
  end
end

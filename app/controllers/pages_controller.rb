class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]
  def home
    if params[:query].present?
      @goals = Goal.where("name ILIKE ?", "%#{params[:query]}%")
    elsif params[:name].present?
      @goals = Goal.where(category: params[:name][:category])
    elsif current_user.present?
      @goals = Goal.where("user_id != #{current_user.id}")
      raise
    else
      @goals = Goal.all
    end
    @goals.order(updated_at: :desc)
  end
end

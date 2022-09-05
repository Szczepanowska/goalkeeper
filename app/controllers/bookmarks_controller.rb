class BookmarksController < ApplicationController
  def new
    @bookmark = Bookmark.new
    authorize @bookmark
  end

  def create
    @bookmark = Bookmark.new(goal_params)
    authorize @bookmark
    @bookmark.user = current_user
    if @bookmark.save
      redirect_to home_path
    else
      render :new
    end
  end

  def destroy
    authorize @bookmark
    @bookmark.destroy
    redirect_to home_path, status: :see_other
  end
end

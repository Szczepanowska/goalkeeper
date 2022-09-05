class BookmarksController < ApplicationController
  def new
    @goal = Goal.find()
  end
end

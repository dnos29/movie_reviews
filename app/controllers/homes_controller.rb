class HomesController < ApplicationController
  def index
    add_breadcrumb "Home", :root_path
    @movies = Movie.all
  end

  def show
    add_breadcrumb "Show", :movies_path
  end

  def not_found

  end
end

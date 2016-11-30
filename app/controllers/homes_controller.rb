class HomesController < ApplicationController
  def index
    add_breadcrumb "Home", :root_path
    @movies = Movie.paginate(:page => params[:page])
  end

  def show
    add_breadcrumb "Show", :movies_path
  end

  def not_found

  end

  def test_mobile
    @roles = Role.all
    @role = Role.new
  end
end

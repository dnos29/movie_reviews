class HomesController < ApplicationController
  def index
    add_breadcrumb "Home", :root_path
    @movies = Movie.search(params[:search]).paginate(:page => params[:page])
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

  def test_ajax
    movies = Movie.where("title like ?", "%#{params[:term]}%")
    if movies.count == 0
      render json: {"no_result": "no result"}
    end
    render json: movies.map(&:title)
  end

  def autosearch
    movies = Movie.all
    render json: movies
  end

  def final_exam

  end
end

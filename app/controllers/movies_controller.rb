class MoviesController < ApplicationController
  helper_method :sort_column, :sort_direction
  before_action :set_movie, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index,:show]

  add_breadcrumb "Home", :root_path

  def search
    if params[:search].present?
      @movie = Movie.search(params[:search])
    else
      @movie = Movie.all
    end
  end
  def index
    authorize! :index ,Movie
    @movies = Movie.search(params[:search]).order(sort_column + " " + sort_direction).paginate(:page => params[:page])
  end

  def show
    # authorize! :show ,Movie
    add_breadcrumb "Show", :movie_path
    @reviews = Review.where(movie_id: @movie.id).order("created_at DESC")

    @video_id = (/([\w-]{11})/.match(@movie.url)).to_s
    @embed_code = "<iframe width='640' height='360' src='http://www.youtube.com/embed/#{@video_id}' frameborder='0' allowfullscreen></iframe>"
    if @reviews.blank?
      @avg_rating = 0
    else
      @avg_rating = @reviews.average(:rating)
    end
  end

  def new
    authorize! :new ,Movie
    add_breadcrumb "New", :new_movie_path
    @movie = current_user.movies.build
  end

  def edit
    authorize! :edit ,Movie
    if  current_user.id != @movie.user_id
      respond_to do |format|
        format.html { redirect_to '/not_found' , alert: "Ban khong co quyen nay" }
        format.json { head :no_content }
      end
      return
    end
  end

  def create
    authorize! :create, Movie
    @movie = current_user.movies.build(movie_params)

    respond_to do |format|
      if @movie.save
        format.html { redirect_to @movie, notice: 'Movie was successfully created.' }
        format.json { render :show, status: :created, location: @movie }
      else
        format.html { render :new }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /movies/1
  # PATCH/PUT /movies/1.json
  def update
    authorize! :update ,Movie
    respond_to do |format|
      if @movie.update(movie_params)
        format.html { redirect_to @movie, notice: 'Movie was successfully updated.' }
        format.json { render :show, status: :ok, location: @movie }
      else
        format.html { render :edit }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movies/1
  # DELETE /movies/1.json
  def destroy
    authorize! :destroy ,Movie
    if  current_user.id != @movie.user_id
      respond_to do |format|
        format.html { redirect_to '/not_found' , alert: "Ban khong co quyen nay" }
        format.json { head :no_content }
      end
      return
    end
    @movie.destroy
    respond_to do |format|
      format.html { redirect_to movies_url, notice: 'Movie was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movie
      @movie = Movie.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def movie_params
      params.require(:movie).permit(:title, :description, :length, :release_year, :rating, :image,:url )
    end

    def sort_column
      params[:sort] || "title"
    end
    def sort_direction
      params[:direction] || "asc"
    end
end

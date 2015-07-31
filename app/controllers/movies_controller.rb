class MoviesController < ApplicationController

  def index
    @movies = Movie.all
  end

  def new
    render :new
  end

  def create
    @movie = Movie.new(params.require(:movie).permit(:title, :quote) )
    @movie.save

    redirect_to  @movie 
  end

  def show
    movie_id = params[:id]
    @movie = Movie.find(movie_id)
    render :show
  end

  def edit
    movie_id = params[:id]
    @movie = Movie.find(movie_id)
  end

  def update
    movie_id = params[:id]
    @movie = Movie.find(movie_id)
    movie_params = params.require(:movie).permit(:title, :quote)
    @movie.update_attributes(movie_params)
    render :show
  end

  def destroy
    movie_id = params[:id]
    movie = Movie.find(movie_id)
    movie.destroy

    redirect_to movies_path
  end

end

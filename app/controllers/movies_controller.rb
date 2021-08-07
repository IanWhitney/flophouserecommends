class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def show
    @movie = if /^tt/.match?(params[:id])
      Movie.find_by_imdb_id(params[:id])
    else
      Movie.find(params[:id])
    end
  end

  def search
    super(Movie, :@movie, :@movies)
  end
end

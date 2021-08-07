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
    query = params.permit(:query)[:query]
    results = Movie.search(query)
    case results.count
    when 0
      redirect_to root_path
    when 1
      @movie = results.first
      render "show"
    else
      @movies = results
      render "index"
    end
  end
end

class MoviesController < ApplicationController
  def show
    @movie = if /^tt/.match?(params[:id])
      Movie.find_by_imdb_id(params[:id])
    else
      Movie.find(params[:id])
    end
  end
end

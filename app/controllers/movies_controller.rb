class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def show
    @movie = if /^tt/.match?(params[:id])
      Movie.includes(
        :episodes,
        recommendations: [
          :host,
          :episode
        ]
      )
        .find_by_imdb_id(params[:id])
    else
      Movie.includes(
        :episodes,
        recommendations: [
          :host,
          :episode
        ]
      )
        .find(params[:id])
    end
  end

  def search
    super(Movie, :@movie, :@movies)
  end
end

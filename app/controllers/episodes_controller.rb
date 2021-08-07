class EpisodesController < ApplicationController
  def index
    @episodes = Episode.all
  end

  def show
    @episode = Episode.find(params[:id])
  end

  def latest
    @episode = Episode.last
    render :show
  end

  def search
    query = params.permit(:query)[:query]
    results = Episode.search(query)
    case results.count
    when 0
      redirect_to root_path
    when 1
      @episode = results.first
      render "show"
    else
      @episodes = results
      render "index"
    end
  end
end

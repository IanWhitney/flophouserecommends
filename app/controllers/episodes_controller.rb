class EpisodesController < ApplicationController
  def index
    @episodes = Episode.includes(:movie).all
  end

  def show
    @episode = _relation.find(params[:id])
  end

  def latest
    @episode = _relation.last
    render :show
  end

  def search
    super(Episode, :@episode, :@episodes)
  end

  def _relation
    Episode
      .includes(
        :hosts,
        :movie,
        recommendations: [
          {
            movie: {
              poster_attachment: [:blob]
            }
          }
        ]
      )
  end
end

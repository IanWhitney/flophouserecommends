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
    super(Episode, :@episode, :@episodes)
  end
end

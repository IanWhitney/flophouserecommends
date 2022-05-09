class HostsController < ApplicationController
  def index
    @hosts = Host.all
  end

  def show
    @host = Host.includes(
      episodes: [:movie, recommendations: [:movie, :host]]
    ).find(params[:id])
  end

  def search
    super(Host, :@host, :@hosts)
  end
end

class HostsController < ApplicationController
  def index
    @hosts = Host.all
  end

  def show
    @host = Host.find(params[:id])
  end

  def search
    query = params.permit(:query)[:query]
    results = Host.search(query)
    case results.count
    when 0
      redirect_to root_path
    when 1
      @host = results.first
      render "show"
    else
      @hosts = results
      render "index"
    end
  end
end

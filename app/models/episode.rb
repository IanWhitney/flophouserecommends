class Episode < ApplicationRecord
  belongs_to :movie, optional: true
  has_and_belongs_to_many :hosts, -> { order("hosts.id") }
  has_many :recommendations

  def self.search(params)
    includes(:movie)
      .joins(:movie)
      .where("episodes.id = ?", params)
      .or(where("movies.title like ?", "%#{params}%"))
  end

  def recommendations_for(host)
    recommendations.where(host: host)
  end

  def find_or_create_host(host)
    return host if hosts.include?(host)

    hosts << host
    host
  end

  def pred
    Episode.find(id - 1)
  rescue ActiveRecord::RecordNotFound
    nil
  end

  def succ
    Episode.find(id + 1)
  rescue ActiveRecord::RecordNotFound
    nil
  end
end

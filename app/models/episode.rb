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

  def title
    if movie.present?
      movie.title
    else
      "No movie watched"
    end
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
    if predecessors(1).present?
      predecessors(1).first
    end
  end

  def predecessors(count)
    self.class
      .where("id < #{id}")
      .order("id desc")
      .first(count)
  end

  def succ
    if successors(1).present?
      successors(1).first
    end
  end

  def successors(count)
    self.class
      .where("id > #{id}")
      .order("id asc")
      .first(count)
  end
end

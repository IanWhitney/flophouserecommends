class Episode < ApplicationRecord
  belongs_to :movie, optional: true
  has_and_belongs_to_many :hosts
  has_many :recommendations

  def recommendations_for(host)
    recommendations.where(host: host)
  end

  def find_or_create_host(host)
    return host if hosts.include?(host)

    hosts << host
    host
  end
end

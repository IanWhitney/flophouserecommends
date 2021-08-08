require "open-uri"
require "tempfile"

class Movie < ApplicationRecord
  has_many :episodes
  has_many :recommendations

  before_save :populate

  has_one_attached :poster

  scope :search_by_title, ->(search) { where("title like ?", "%#{search}%") }

  def self.search(params)
    where(id: params)
      .or(search_by_title(params))
  end

  def recommended?
    recommendations.any?
  end

  def recommendations
    @recommendations ||= Recommendation.where(movie: self)
  end

  private

  def imdb_entry
    @imdb_entry || ImdbEntry.build(imdb_id)
  end

  def populate
    return nil if title.present?
    return nil unless imdb_id.present?

    self.title = imdb_entry.title

    copy_poster

    nil
  end

  def copy_poster
    return nil if poster.attached?
    return nil unless imdb_entry.has_poster?

    begin
      tmp = Tempfile.new(imdb_id, binmode: true)
      tmp << URI(imdb_entry.poster_uri.to_s).read
      tmp.rewind
      poster.attach(io: tmp, filename: "#{id}.jpg", content_type: "image/jpeg", identify: false)
    rescue
      nil
    end
  end
end

# frozen_string_literal: true

class MovieComponent < ViewComponent::Base
  def initialize(movie:)
    @movie = movie
  end
end

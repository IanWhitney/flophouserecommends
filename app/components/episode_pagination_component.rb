# frozen_string_literal: true

class EpisodePaginationComponent < ViewComponent::Base
  def initialize(episode:)
    @episode = episode
  end
end

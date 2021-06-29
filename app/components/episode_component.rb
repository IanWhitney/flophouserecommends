# frozen_string_literal: true

class EpisodeComponent < ViewComponent::Base
  def initialize(episode:)
    @episode = episode
  end
end

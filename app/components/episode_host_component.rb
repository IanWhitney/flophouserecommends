# frozen_string_literal: true

class EpisodeHostComponent < ViewComponent::Base
  with_collection_parameter :host

  def initialize(episode:, host:)
    @episode = episode
    @host = host
  end
end

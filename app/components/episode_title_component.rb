# frozen_string_literal: true

class EpisodeTitleComponent < ViewComponent::Base
  with_collection_parameter :episode

  def initialize(episode:)
    @episode = episode
  end
end

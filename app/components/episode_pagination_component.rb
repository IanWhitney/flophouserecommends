# frozen_string_literal: true

class EpisodePaginationComponent < ViewComponent::Base
  def initialize(episode:, pages_to_display: 7)
    @episode = episode

    pred = episode.predecessors((pages_to_display - 1) / 2)
    succ = episode.successors((pages_to_display - 1) / 2)

    if pred.count > succ.count
      pred = episode.predecessors(pages_to_display - succ.count)
    else
      succ = episode.successors(pages_to_display - pred.count)
    end

    @paged_episodes = [succ.reverse, episode, pred].flatten
  end
end

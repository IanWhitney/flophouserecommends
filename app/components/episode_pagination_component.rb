# frozen_string_literal: true

class EpisodePaginationComponent < ViewComponent::Base
  def initialize(episode:, pages_to_display: 7)
    @episode = episode

    pred = episode.predecessors((pages_to_display - 1) / 2)
    succ = episode.successors((pages_to_display - 1) / 2)

    if pred.count > succ.count
      pred = episode.predecessors(pages_to_display - succ.count - 1)
    elsif pred.count < succ.count
      succ = episode.successors(pages_to_display - pred.count - 1)
    end

    @paged_episodes = [succ.reverse, @episode, pred].flatten
    default_classes = %w[text-xs rounded-lg text-center px-2 md:px-4 lg:px-8 py-2]
    @current_classes = default_classes.dup << "bg-yellow-400"
    @go_to_classes = default_classes.dup << "bg-indigo-400"
  end
end

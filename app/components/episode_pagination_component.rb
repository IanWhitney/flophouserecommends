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
    default_classes = %w[text-sm rounded-lg text-center font-extrabold px-2 md:px-4 lg:px-8 py-2 ring-2 ring-red-800 ring-opacity-30]
    @current_classes = default_classes.dup << %w[bg-orange-800 text-lime-50]
    @go_to_classes = default_classes.dup << %w[bg-lime-900 text-orange-50]
  end
end

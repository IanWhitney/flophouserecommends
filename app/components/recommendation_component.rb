# frozen_string_literal: true

class RecommendationComponent < ViewComponent::Base
  def initialize(recommendation:)
    @recommendation = recommendation
  end
end

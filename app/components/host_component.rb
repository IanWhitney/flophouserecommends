# frozen_string_literal: true

class HostComponent < ViewComponent::Base
  def initialize(host:)
    @host = host
  end
end

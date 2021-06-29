# frozen_string_literal: true

class HostNameComponent < ViewComponent::Base
  with_collection_parameter :host

  def initialize(host:)
    @host = host
  end
end

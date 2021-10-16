class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def readonly?
    Rails.env.production?
  end
end

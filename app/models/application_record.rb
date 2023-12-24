class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  def readonly?
    Rails.env.production?
  end
end

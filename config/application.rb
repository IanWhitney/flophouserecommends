require_relative "boot"

require "active_record/railtie"
require "action_controller/railtie"
require "active_storage/engine"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module App
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
    config.active_storage.service = :amazon

    config.hosts << "afternoon-hollows-06212.herokuapp.com"
    config.hosts << "www.flophouserecommends.com"
    config.hosts << "flophouserecommends.com"
    config.hosts << "localhost"
  end
end

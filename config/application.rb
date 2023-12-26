require_relative "boot"

require "rails"
require "active_model/railtie"
# require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
# require "action_mailer/railtie"
# require "action_mailbox/engine"
# require "action_text/engine"
require "action_view/railtie"
# require "action_cable/engine"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Flophouserecommends
  class Application < Rails::Application
    config.load_defaults 7.1

    config.autoload_lib(ignore: %w[assets tasks])

    config.generators.system_tests = nil
    config.active_storage.service = :amazon

    config.hosts << "afternoon-hollows-06212.herokuapp.com"
    config.hosts << "www.flophouserecommends.com"
    config.hosts << "flophouserecommends.com"
    config.hosts << "localhost"
  end
end

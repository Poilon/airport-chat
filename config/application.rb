require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module AirportChat
  class Application < Rails::Application
    config.load_defaults 7.0
    config.action_cable.mount_path = '/cable'
  end
end

require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module LESMassagesDePauline
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    # config.action_mailer.delivery_method = :mailjet
    # config.action_mailer.mailjet_settings = {
    #   api_key: ENV['MAILJET_API_KEY'],
    #   secret_key: ENV['MAILJET_SECRET_KEY']
    # }
    # TODO: Add domain name to mailjet
    # TODO: Create alias sender address -> https://support.starred.com/docs/adding-alias-sender-addresses
    # TODO: Add below
    # config.default_from = 'example@here.com'
    # TODO: Change owner
  end
end

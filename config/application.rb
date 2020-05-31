require_relative 'boot'

require "rails"

require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_mailbox/engine"
require "action_text/engine"
require "action_view/railtie"
require "action_cable/engine"
# require "sprockets/railtie"
# require "rails/test_unit/railtie"

Bundler.require(*Rails.groups)

module QRAppBe
  class Application < Rails::Application
    config.load_defaults 6.0
    config.time_zone = 'Europe/Warsaw'

    config.api_only = true

    config.active_record.belongs_to_required_by_default = false

    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*'
        resource(
            '*',
            headers: :any,
            expose: [
                'Authorization',
                'Content-Type',
                'Authorization',
                'Accept',
                'Client-Security-Token',
                'Accept-Encoding',
                'iat',
                'exp',
                'jti',
                'XMLHttpRequest'
            ],
            methods: [:get, :patch, :put, :delete, :post, :options, :show]
        )
      end
    end

  end
end

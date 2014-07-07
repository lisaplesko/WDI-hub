require File.expand_path('../boot', __FILE__)

# Pick the frameworks you want:
require "active_model/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module GithubApi
  class Application < Rails::Application

    # https://github.com/plataformatec/devise/issues/2065

    config.middleware.use ActionDispatch::Cookies
    config.middleware.use ActionDispatch::Session::CookieStore

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    # Add Rack::Cors as middleware
    # WARNING: Allow ALL cross site scripting
    config.middleware.use Rack::Cors do
      allow do
        # WARNING: Allow ALL cross site scripting from ALL domains
        origins '*'
        # WARNING: Allow ALL HTTP method
        resource '*', :headers => :any, :methods => [:get, :post, :options]
      end
    end

    # stack = Faraday::RackBuilder.new do |builder|
    #   builder.use Faraday::HttpCache
    #   builder.use Octokit::Response::RaiseError
    #   builder.adapter Faraday.default_adapter
    # end
    # Octokit.middleware = stack

  end
end

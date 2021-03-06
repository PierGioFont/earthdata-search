EarthdataSearchClient::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb

  # The test environment is used exclusively to run your application's
  # test suite. You never need to work with it otherwise. Remember that
  # your test database is "scratch space" for the test suite and is wiped
  # and recreated between test runs. Don't rely on the data there!
  config.cache_classes = true

  config.eager_load = true

  # Configure static asset server for tests with Cache-Control for performance
  config.assets.digest = true
  config.serve_static_files = true
  config.static_cache_control = "public, max-age=3600"

  # Show full error reports and disable caching
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Raise exceptions instead of rendering exception templates
  config.action_dispatch.show_exceptions = false

  # Disable request forgery protection in test environment
  config.action_controller.allow_forgery_protection    = false

  # Tell Action Mailer not to deliver emails to the real world.
  # The :test delivery method accumulates sent emails in the
  # ActionMailer::Base.deliveries array.
  config.action_mailer.delivery_method = :test

  # Print deprecation notices to the stderr
  config.active_support.deprecation = :stderr

  config.assets.configure do |env|
    env.cache = ThreadSafe::Cache.new
  end

  VCR.configure { |c| VCR::EDSCConfigurer.configure(c) }

  config.logo_name = "DEV"
  config.env_name = ""
  config.tophat_url = ""

  config.url_limit = 130

  config.middleware.use RackSessionAccess::Middleware
  config.middleware.use Middleware::RackRequestBlocker

  # This is also the client ID sent to OpenSearch. It is kept the same since the OpenSearch endpoint ultimately
  # talks to ECHO/CMR.
  config.cmr_client_id = ENV['cmr_client_id'] || 'edsc-dev'

  config.log_level = :info
end

require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(*Rails.groups)

module Podcaster
  class Application < Rails::Application
    config.i18n.default_locale = :ru
    config.i18n.locale = :ru
    config.i18n.available_locales = [:ru]
  end
end

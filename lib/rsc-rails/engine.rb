require 'rails'
require 'css-rewrite'

require 'pry-byebug'

module RscRails
  class Engine < ::Rails::Engine
    isolate_namespace RscRails

    initializer :rsc do |app|
      app.config.assets.precompile += [
        File.join(%w(rsc keyboard.png)),
        File.join(%w(rsc monitor.png))
      ]

      CssRewrite.configure do |config|
        config.rewrite(/rsc\.min\.css$/) do |url|
          RscRails.url_join(
            Rails.application.config.assets.prefix,
            RscRails.resolve_asset(File.join('rsc', File.basename(url)))
          )
        end
      end
    end
  end
end

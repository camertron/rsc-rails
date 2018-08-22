require 'rsc-rails/version'
require 'rsc-rails/engine'

module RscRails
  class << self
    def resolve_asset(asset_path)
      env = Rails.application.assets || environment
      asset = env.find_asset(asset_path)

      if Rails.application.config.assets.digest
        asset.try(&:digest_path)
      else
        asset.try(&:logical_path)
      end
    end

    def url_join(*segments)
      segments.compact!

      # this regex strips off leading and trailing forward slashes
      joined = segments.map { |p| p.sub(/\A\/?(.*?)\/?\z/, "\\1") }.join('/')

      # handle absolute URLs
      segments.first.start_with?('/') ? "/#{joined}" : joined
    end

    private

    def environment
      @environment ||= Sprockets::Railtie.build_environment(Rails.application)
    end
  end
end

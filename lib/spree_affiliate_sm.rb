require 'spree_core'
require 'spree_affiliate_sm_hooks'

module SpreeAffiliateSm
  class Engine < Rails::Engine

    def self.activate
      Dir.glob(File.join(File.dirname(__FILE__), "../app/**/*_decorator*.rb")) do |c|
        Rails.env.production? ? require(c) : load(c)
      end

      AppConfiguration.class_eval do
        preference :cookie_name, :string, :default => 'sm_referrerid'
      end
    end #self.activate
    
    config.autoload_paths += %W(#{config.root}/lib)
    config.to_prepare &method(:activate).to_proc
  end
end

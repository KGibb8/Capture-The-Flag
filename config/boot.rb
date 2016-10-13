ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../Gemfile', __dir__)

require 'bundler/setup' # Set up gems listed in the Gemfile.

module DefaultOptions
  def default_options
    super.merge!(Port: 6666)
  end
end

Rails::Server.prepend(DefaultOptions)

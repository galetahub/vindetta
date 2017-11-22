require "bundler/setup"
require "vindetta"
require "pry"

Dir[File.dirname(__FILE__) + "/support/**/*.rb"].each { |f| require f }

RSpec.configure do |config|
  config.example_status_persistence_file_path = ".rspec_status"
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
  
  config.include(Capture)
  config.extend(CLIMacros)
end

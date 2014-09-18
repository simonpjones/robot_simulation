$:.push File.expand_path("../lib", __FILE__)


require 'robot_simulation'
require 'rspec'

RSpec.configure do |config|
  # config.mock_with :rspec do |c|
  #   c.syntax = [:should, :expect]
  # end
  # config.expect_with :rspec do |c|
  #   c.syntax = [:should, :expect]
  # end
end


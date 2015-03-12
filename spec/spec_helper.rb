require "codeclimate-test-reporter"
CodeClimate::TestReporter.start

require 'active_support'
require 'multicolor'

RSpec.configure do |config|
  config.mock_with :rspec
  config.color = true
end

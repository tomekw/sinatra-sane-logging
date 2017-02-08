require "simplecov"

SimpleCov.start do
  add_group "Library", "lib"
  add_filter "/spec/"
end

$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)

require "pry"
require "rack"
require "rack/test"
require "sinatra/sane_logging"

if ENV["CIRCLE_ARTIFACTS"]
  SimpleCov.coverage_dir(File.join(ENV["CIRCLE_ARTIFACTS"], "coverage"))
end

RSpec.configure do |config|
  config.order = :random
end

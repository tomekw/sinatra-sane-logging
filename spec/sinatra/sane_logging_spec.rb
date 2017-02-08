require "spec_helper"

RSpec.describe Sinatra::SaneLogging do
  include Rack::Test::Methods

  class TestLogger < Rack::NullLogger
    def flush; end
  end

  class TestApp < Sinatra::Base
    register Sinatra::SaneLogging

    set :sane_logger, TestLogger.new(self)

    get "/" do
      logger.info "OK"

      "OK"
    end
  end

  let(:app) { TestApp }

  it "logs 'OK" do
    expect_any_instance_of(TestLogger).to receive(:info).with("OK").once

    get "/"
  end
end

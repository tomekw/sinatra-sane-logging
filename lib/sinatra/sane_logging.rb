require "rack"
require "sinatra/base"

module Sinatra
  module SaneLogging
    class NullLogger < Rack::NullLogger
      def flush; end
    end

    def self.registered(app)
      app.set :sane_logger, NullLogger.new(app)

      app.configure do
        app.use Rack::CommonLogger, app.sane_logger
      end

      app.before do
        env["rack.errors"] = app.sane_logger
        env["rack.logger"] = app.sane_logger
      end
    end
  end

  register SaneLogging
end

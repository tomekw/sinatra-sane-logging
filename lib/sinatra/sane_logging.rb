require "sinatra/base"

module Sinatra
  module SaneLogging
    def sane_logging(logger:)
      configure do
        use Rack::CommonLogger, logger
      end

      before do
        env["rack.errors"] = logger
        env["rack.logger"] = logger
      end
    end
  end

  register SaneLogging
end

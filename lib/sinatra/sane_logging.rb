module Sinatra
  module SaneLogging
    def self.included(base)
      base.send(:extend, ClassMethods)
    end

    module ClassMethods
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
  end
end

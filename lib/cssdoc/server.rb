require "rack"

module Cssdoc
  class Server < Rack::Handler::WEBrick
    class << self
      def run
        observe_termination
        super(App.new, :Port => 4567)
      end

      private

      def observe_termination
        trap("SIGINT") { exit! }
      end
    end
  end
end

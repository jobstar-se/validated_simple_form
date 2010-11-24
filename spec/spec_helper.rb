require "bundler"
Bundler.setup

require "action_view"
require "action_controller"

require "rspec"
require "simple_form"

require "validated_simple_form"

require "fixtures"

module ActionView
  module Helpers
    module CaptureHelper
      def with_output_buffer(buf = nil) #:nodoc:
        self.output_buffer, old_buffer = buf, output_buffer
        yield
        output_buffer
      ensure
        self.output_buffer = old_buffer
      end
    end
  end
end


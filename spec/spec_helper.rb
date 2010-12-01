require "bundler"
Bundler.setup

require "action_view"
require "action_controller"

require "rspec"
require "simple_form"

require "validated_simple_form"

require "fixtures"

module SpecHelper
  include ActionPack
  include ActionView::Context if defined?(ActionView::Context)
  include ActionController::RecordIdentifier
  include ActionView::Helpers::FormHelper
  include ActionView::Helpers::FormTagHelper
  include ActionView::Helpers::FormOptionsHelper
  include ActionView::Helpers::UrlHelper
  include ActionView::Helpers::TagHelper
  include ActionView::Helpers::TextHelper
  include ActionView::Helpers::ActiveRecordHelper if defined?(ActionView::Helpers::ActiveRecordHelper)
  include ActionView::Helpers::ActiveModelHelper if defined?(ActionView::Helpers::ActiveModelHelper)
  include ActionView::Helpers::DateHelper
  include ActionView::Helpers::CaptureHelper
  include ActionView::Helpers::AssetTagHelper
  include ValidatedSimpleForm::ActionViewExtensions::FormHelper

  def self.included(base)
    base.class_eval do
      def protect_against_forgery?
        false
      end

      def users_path
        "/users"
      end
    end
  end
end


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


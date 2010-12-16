module ValidatedSimpleForm
  require 'engine' if defined?(Rails) && Rails::VERSION::MAJOR == 3
  require "validated_simple_form/form_builder"
  require "validated_simple_form/action_view_extensions/form_helper"
end

ActiveSupport.on_load(:action_view) do
  include ValidatedSimpleForm
  include ValidatedSimpleForm::ActionViewExtensions::FormHelper
end

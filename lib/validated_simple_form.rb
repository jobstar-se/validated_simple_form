require "validated_simple_form/form_builder"
require "validated_simple_form/validators/presence_validator"
require "validated_simple_form/validators/format_validator"
require "validated_simple_form/validators/length_validator"
require "validated_simple_form/validators/numericality_validator"

module ValidatedSimpleForm
  def self.included(base)
    base.class_eval do
      include ValidatedSimpleForm::Validators::PresenceValidator
      include ValidatedSimpleForm::Validators::FormatValidator
      include ValidatedSimpleForm::Validators::LengthValidator
      include ValidatedSimpleForm::Validators::NumericalityValidator
    end
  end
end

#ActiveSupport.on_load(:action_view) do
#  include ValidatedFields
#  ActionView::Base.default_form_builder = ValidatedFields::FormBuilder
#end
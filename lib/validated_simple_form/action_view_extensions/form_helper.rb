module ValidatedSimpleForm
  module ActionViewExtensions
    # This modules create simple form wrappers around default form_for,
    # fields_for and remote_form_for.
    #
    # Example:
    #
    #   validated_simple_form_for @user do |f|
    #     f.input :name, :hint => 'My hint'
    #   end
    #
    module FormHelper
      include SimpleForm::ActionViewExtensions::FormHelper
      include ActionController::RecordIdentifier

      [:form_for, :fields_for, :remote_form_for].each do |helper|
        class_eval <<-METHOD, __FILE__, __LINE__
          def validated_simple_#{helper}(record_or_name_or_array, *args, &block)
            options = args.extract_options!
            options[:builder] = ValidatedSimpleForm::FormBuilder
            css_class = case record_or_name_or_array
              when String, Symbol then record_or_name_or_array.to_s
              when Array then dom_class(record_or_name_or_array.last)
              else dom_class(record_or_name_or_array)
            end
            options[:html] ||= {}
            options[:html][:class] = "simple_form \#{css_class} \#{options[:html][:class]}".strip

            with_custom_field_error_proc do
              #{helper}(record_or_name_or_array, *(args << options), &block)
            end
          end
        METHOD
      end
    end
  end
end
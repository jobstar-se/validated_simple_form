module ValidatedSimpleForm
  module Validators
    #
    # Sets options for ActiveModel::Validations::RemoteValidator
    #
    module RemoteValidator
      def self.prepare_options(object_name, attribute, object, options)
        options["data-validation-url"] = "/validated_simple_form/validate/#{object_name}"
        options["data-validation-attribute"] = attribute
        options["data-validation-id"] = object.id if object
        options
      end
    end
  end
end
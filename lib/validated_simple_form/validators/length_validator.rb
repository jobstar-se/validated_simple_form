module ValidatedSimpleForm
  module Validators
    #
    # Sets options for ActiveModel::Validations::LengthValidator
    #
    # Should be used for strings only. In order to validata numbers,
    # use NumericalityValidator.
    #
    module LengthValidator
      def self.prepare_options(validator, options)
        voptions = validator.options

        options[:min] = voptions[:minimum]      if voptions[:minimum].present?
        options[:min] = voptions[:in].first     if voptions[:in].present?
        options[:min] = voptions[:within].first if voptions[:within].present?

        options[:maxlength] = voptions[:maximum]     if voptions[:maximum].present?
        options[:maxlength] = voptions[:in].last     if voptions[:in].present?
        options[:maxlength] = voptions[:within].last if voptions[:within].present?

        options['data-length'] = validator.options[:is] if validator.options[:is].present?

        # messages
        options["data-error-invalid-length"] = voptions[:message]   || "Invalid length"
        options["data-error-too-short"]      = voptions[:too_short] || "Too short"

        #options["data-error-too-long"]       = voptions[:too_long]  || "Too long"

        options["data-allow-blank"] = true if voptions[:allow_nil].present?   && voptions[:allow_nil]   == true
        options["data-allow-blank"] = true if voptions[:allow_blank].present? && voptions[:allow_blank] == true

        options
      end
    end

  end
end
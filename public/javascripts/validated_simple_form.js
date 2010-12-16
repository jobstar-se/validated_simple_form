(function($){

  var validate = {
    presence: function(element, errors) {
      var value = $.trim(element.attr('value'));
      if (value === "") {
        callbacks.error(element, errors['presence']);
        callbacks.afterError(element, errors['presence']);
        return false;
      }
      return true;
    },
    format: function(element, errors) {
      var value   = $.trim(element.attr('value'));
      var allowBlank = element.attr('data-allow-blank') === "true";
      if (value === "" && allowBlank) {
        return true;
      }
      var p = element.attr('pattern');
      var re = new RegExp(p.slice(p.indexOf('/')+1, p.lastIndexOf('/')), p.slice(p.lastIndexOf('/')+1));
      var res = re.test(value);
      if (!res) {
        settings.error(element, errors['format']);
        settings.afterError(element, errors['format']);
      }
      return res;
    },
    length: function(element, errors) {
      var value      = $.trim(element.attr('value'));
      var min        = parseInt(element.attr('min'));
      var allowBlank = element.attr('data-allow-blank') === "true";

      if (value === "" && allowBlank) {
          return true;
      }

      if (value.length < min) {
        var msgKey = 'too-short' in errors ? 'too-short' : 'invalid-length';
        callbacks.error(element, errors[msgKey]);
        callbacks.afterError(element, errors[msgKey]);
        return false;
      }
      return true;
    },
    remote: function(element) {
      if(element.attr('data-initial-value') === element.val()){ return false; }
      $.post(element.attr('data-validation-url'),
        {
          attribute: element.attr('data-validation-attribute'),
          value: element.val(),
          id: element.attr('data-validation-id')
        },
        function(data){
          element.attr('data-initial-value', element.val());
          if(data.valid){
            callbacks.success(element);
            callbacks.afterSuccess(element);
          } else {
            callbacks.error(element, data.message);
            callbacks.afterError(element, data.message);
          }
        },
        'json'
      );
      return false;
    }
  };

  var methods = {
    defaultSuccess: function(element){
      element.next('span.error').remove();
    },
    defaultError: function(element, message){
      element.next('span.error').remove();
      element.after('<span class="error" style="color:#C22121;">' + message + '</span>');
    },
    getErrorMessages: function(element) {
      var errors = [];
      for (var i = 0; i < element.attributes.length; i++) {
        var attr  = element.attributes[i];
        var match = attr.nodeName.match(/^data-error-(.*)$/);
        if (match) {
          errors[match[1]] = attr.nodeValue;
        }
      }
      return errors;
    },
    validate: function(event) {
      var target = event.currentTarget;
      var valid  = true;
      var validators = $(target).attr('data-validates');

      if (!validators) {
        return;
      }

      validators = validators.split(' ');

      for (var i = 0; i < validators.length; i++) {
        valid = valid && validate[validators[i]]($(target), methods.getErrorMessages(target));
      }

      if (valid) {
        callbacks.success($(target));
        callbacks.afterSuccess($(target));
      }
    }
  };

  var callbacks = {
    success: methods.defaultSuccess,
    afterSuccess: function(element){},
    error: methods.defaultError,
    afterError: function(element, message){}
  };

  $.fn.validatedSimpleForm = function(options) {
    if (options) { $.extend(callbacks, options); }
    $(this).find('input.validated').blur($.proxy(methods.validate, this));
    return this;
  };

  $.validatedSimpleForm = function(options) {
    $('form.simple_form').validatedSimpleForm(options);
  };

})( jQuery );
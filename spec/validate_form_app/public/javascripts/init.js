$(document).ready(function() {
  $.validatedSimpleForm();

//  $('form.simple_form').validatedSimpleForm();

//  $.validatedSimpleForm({
//    afterError: function(element, message){
//      element.css("border-color", "red");
//    },
//    afterSuccess: function(element){
//      element.css("border-color", "green");
//    }
//  });

//  $.validatedSimpleForm({
//    error: function(element, message){
//      if (element.next('span.error').is(':empty')) {
//        element.after('<span class="error" style="color:red;">' + message + '</span>');
//      }
//    },
//    success: function () {
//      element.next('span.error').remove();
//    }
//  });
});

Rails.application.routes.draw do
  match 'validated_simple_form/validate/:type' => 'validated_simple_form/validations#create'
end

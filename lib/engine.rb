require 'rails'
require 'validated_simple_form'

#require 'action_controller'
#require 'application_helper'

module ValidatedSimpleForm
  class Engine < Rails::Engine
    
    # Load rake tasks
    #rake_tasks do
    #  load File.join(File.dirname(__FILE__), 'rails/railties/tasks.rake')
    #end

    initializer "static assets" do |app|
      app.middleware.use ::ActionDispatch::Static, "#{root}/public"
    end
  end
end

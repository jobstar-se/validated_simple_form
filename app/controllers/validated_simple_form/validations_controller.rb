module ValidatedSimpleForm
  class ValidationsController < ApplicationController

    def create
      object_type, attribute, id = params['type'].capitalize.constantize, params['attribute'].to_sym, params['id'].to_i
      @object = (id > 0) ? object_type.find(id) : object_type.new
      @object[attribute] = params['value']
      @object.valid?
      render :json => {
        :valid => @object.errors[attribute].empty?,
        :message => @object.errors[attribute].map{ |e| "#{attribute.to_s.capitalize} #{e}" }.join(', ') }
    end
  end
end

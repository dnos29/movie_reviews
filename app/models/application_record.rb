class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  # rescue_from CanCan::AccessDenied do |exception|
  #   redirect_to '/not_found', :alert => exception.message
  # end
end

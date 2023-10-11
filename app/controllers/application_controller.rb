class ApplicationController < ActionController::API
    include Pundit::Authorization
   rescue_from Pundit::NotAuthorizedError, with: :employee_not_authorized

   private
   def employee_not_authorized
      render json: 'You are not authorized to perform this action', status: 401
   end
end

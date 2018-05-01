class RegistrationsController < Devise::RegistrationsController
	before_action :sign_up_params, only: [:create]
	
	def create
    	super
  	end

	def sign_up_params
		devise_parameter_sanitizer.permit(:sign_up, keys: [:lawyer_id])
	    params.require(:user).permit(:name, :cpf, :birth, :maritalstatus, :telephone, :neighborhood, :state, :city, :street, :email, :password, :password_confirmation)
	end

	def account_update_params
	    params.require(:user).permit(:name, :cpf, :birth, :maritalstatus, :telephone, :neighborhood, :state, :city, :street, :email, :password, :password_confirmation, :current_password)
	end
end

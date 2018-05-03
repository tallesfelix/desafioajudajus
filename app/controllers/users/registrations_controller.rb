# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :sign_up_params, only: [:create]
  
  def create
      super
    end

#Customização do deivse controller em users para permitir ser alocado um advogado na criação do User e adionar outros campos na sua criação
  def sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:lawyer_id])
    params.require(:user).permit(:name, :cpf, :birth, :maritalstatus, :telephone, :neighborhood, :state, :city, :street, :email, :password, :password_confirmation)
  end

  def account_update_params
      params.require(:user).permit(:name, :cpf, :birth, :maritalstatus, :telephone, :neighborhood, :state, :city, :street, :email, :password, :password_confirmation, :current_password)
  end
end

# frozen_string_literal: true

class Lawyers::RegistrationsController < Devise::RegistrationsController

#Customização do devise controller dos advogados para permitir adicionar outros campos em sua criação
  def sign_up_params
      params.require(:lawyer).permit(:name, :birth, :cpf, :oab, :state, :telephone, :email, :password, :password_confirmation)
  end

  def account_update_params
      params.require(:lawyer).permit(:name, :birth, :cpf, :oab, :state, :telephone, :email, :password, :password_confirmation, :current_password)
  end
end

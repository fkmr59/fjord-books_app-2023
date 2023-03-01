# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(
      :sign_up,
      keys: [:email, :password, :postal_code, :address, :profile]
    )
    devise_parameter_sanitizer.permit(
      :account_update, 
      keys: [:email, :password, :postal_code, :address, :profile]
    )
  end
end

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  layout :layout

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

    def configure_permitted_parameters
      update_attrs = [:login, :avatar, :avatar_cache]
      devise_parameter_sanitizer.permit :account_update, keys: update_attrs
      devise_parameter_sanitizer.permit :sign_up, keys: update_attrs
    end

    def layout
      if devise_controller? && resource_name == :account && action_name == "edit" && account_signed_in?
        'dashboard'
      else
        'application'
      end
    end

    def authenticate_user!
      if account_signed_in?
      else
        redirect_to new_account_session_path
      end
    end

end

class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(_user)
    dashboard_index_path
  end

  private

  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :phone_no, :email, :password, :password_confirmation, :current_password)
  end
end

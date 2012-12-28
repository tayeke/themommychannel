class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user
  helper_method :user_signed_in?
  helper_method :correct_user?
  before_filter :set_locale

  private

  def set_locale
    I18n.locale = :en
  end

  def authenticate_admin!
    if !current_user
      redirect_to new_user_session_path
    elsif !current_user.has_role?(:admin)
      redirect_to root_url, :alert => "Access denied."
    end
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end
end

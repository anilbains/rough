class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user
  before_action :require_user

  def current_user
    User.find_by(id: session["user_id"])
  end

  def require_user
    if current_user.nil?
      redirect_to new_session_path, alert: "Please login for further access"

    end
  end



end

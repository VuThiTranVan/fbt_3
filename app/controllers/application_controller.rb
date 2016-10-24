class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def verify_admin
    unless current_user.is_admin?
      flash[:danger] = t "admin.message"
      redirect_to root_url
    end
  end
end

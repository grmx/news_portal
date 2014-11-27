module SessionsHelper
  def logged_in?
    current_user != nil
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
  
  private
  
  def auth_user
    redirect_to new_sessions_path, notice: "Please, log in." unless logged_in?
  end
end

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

  def current_user
    return nil if session[:user_id].nil?
    begin
      User.find(session[:user_id]) 
   rescue ActiveRecord::RecordNotFound => e
     return nil
   end
  end
  def ensure_that_signed_in 
    redirect_to signin_path, notice:'you should be signed in' if current_user.nil?
  end

  def ensure_that_admin
    redirect_to :back, notice: 'you should be admin' unless current_user.admin?
  end

end

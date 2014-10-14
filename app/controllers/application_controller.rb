class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # Currently current_user is a placeholder
  # Under normal circumstances it would return the
  # currently authenticated user
  def current_user
    @current_user ||= User.new
  end

end

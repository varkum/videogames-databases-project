class ApplicationController < ActionController::Base
  before_action :set_current_user

  private

  def set_current_user
    if session[:user_id].present?
      Current.user = User.find(session[:user_id])
    end
  end
end

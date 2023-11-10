class SessionsController < ApplicationController
  def new
  end

  def create
    if (user = User.authenticate_by(email: params[:email], password: params[:password]))
      session[:user_id] = user.id
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity, alert: "Wrong email or password. Please try again"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
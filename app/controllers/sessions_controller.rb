class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: "Welcome aboard!"
    else
      flash.now[:alert] = "Combination Email/Password is invalid."
      render :new
    end
  end
  
  def destroy
    @current_user = nil
    session.delete(:user_id)
    redirect_to root_path, notice: "See you later!"
  end
end

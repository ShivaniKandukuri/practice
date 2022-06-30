class SessionsController < ApplicationController
  def new
  end
  def create
    user=User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id]=user.id
    else
      render 'new'
    end
  end
  def destroy
    sessoin[:user_id]=nil
    format.html { redirect_to root_path, notice: "Looged  off" }
    redirect_to root_path
  end
end

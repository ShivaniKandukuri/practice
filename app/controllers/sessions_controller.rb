class SessionsController < ApplicationController
  def new
  end
  def create
    user=User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id]=user.id
      flash[:notice]="Logged in sucessfully"
      redirect_to user
    else
      flash[:alert]="there was something wring with login crdentials"
      render 'new'
    end
  end
  def destroy
    sessoin[:user_id]=nil
    flash.now[:alert]="There was something wrong" 
    redirect_to root_path
  end
end

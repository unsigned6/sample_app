class SessionsController < ApplicationController
add_flash_types :success, :info, :warning, :danger, :error
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_to user
    else
      flash.now[:error] = "Invalid email/password combination" 
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end
end

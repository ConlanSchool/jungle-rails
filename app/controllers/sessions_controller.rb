class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    authenticated = user && user.authenticate(params[:session][:password])
    Rails.logger.info "Authenticated: #{authenticated}"
  
    if authenticated
      session[:user_id] = user.id
      redirect_to root_path, notice: 'Successfully logged in.'
    else
      flash.now[:alert] = 'Invalid email/password combination'
      render :new
    end
  end
  

  def destroy
    session.delete(:user_id)
    redirect_to root_path, notice: 'Successfully logged out.'
  end
end

class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:session][:username].downcase, pass: params[:session][:password])
    if user 
      # Log the user in and redirect to the user's show page.
      log_in user
      redirect_to user
    else
      # Create an error message.
      flash.now[:danger] = 'Invalid username/password combination'
      render 'new'
    end
  end

  def destroy
    log_out
    session[:user_id] = nil
    redirect_to root_url
  end


end

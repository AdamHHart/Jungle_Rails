class SessionsController < ApplicationController
  def create
    # If the user exists AND the password entered is correct.
    # if user && user.authenticate(params[:password])
      # Save the user id inside the browser cookie. This is how we keep the user 
      # logged in when they navigate around our website.
      if user = User.authenticate_with_credentials(params[:email], params[:password])
        session[:user_id] = user.id
        redirect_to root_path
        # success logic, log them in
      else
        redirect_to login_path
        # failure, render login form
      end
    end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end
end


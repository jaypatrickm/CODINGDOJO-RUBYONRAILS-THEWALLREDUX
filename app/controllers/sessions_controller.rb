class SessionsController < ApplicationController
  #bring up a form for a new session aka login form
  def new
  end

  #create the session resource ie, let user log in
  def create
  	#this references the function we made in user.rb
  	user = User.authenticate(params[:session][:email], params[:session][:password])
  	if user.nil?
      flash[:error] = "Email was not found."
      redirect_to new_session_path
    elsif user == false
      flash[:error] = "password was incorrect"
  	  #if there is an error, redirect back to login
  		redirect_to new_session_path
  	else
  		sign_in user #helper function
  		redirect_to '/wall'
  	end
  end

  def destroy
  	sign_out #helper function
  	redirect_to signin_path
  end
end

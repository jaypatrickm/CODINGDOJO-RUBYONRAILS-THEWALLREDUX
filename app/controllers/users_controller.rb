class UsersController < ApplicationController
  def index
    @user = User.new
    if session[:user_id]
      redirect_to '/wall'
    end
    @messages = Message.all
  end

  def new
  	@user = User.new
  end

  def create #restful route to make new user!
  	@user = User.new(user_params)
  	if @user.save
  		sign_in @user
  		flash[:notice] = 'New user created!'
  		redirect_to @user, notice: 'User was successfully created.'
  	else
  		flash[:errors] = @user.errors.full_messages
  		redirect_to '/'
  	end
  end

  def show
  	@user = User.find(session[:user_id])
  end
  #define strong parameters!
  private
  	def user_params
  		params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  	end
end

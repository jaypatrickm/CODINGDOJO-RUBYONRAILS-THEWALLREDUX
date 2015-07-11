class MessagesController < ApplicationController
  def index
  	@message = Message.new
  	@user = User.find(session[:user_id])
  	# @messages = User.select('messages.id, messages.content, messages.updated_at, messages.user_id, users.first_name, users.last_name').joins(:messages)
  	@messages = Message.select('messages.*, users.first_name, users.last_name').joins(:user)
  end

  def new

  end

  def create
  	@message = Message.new(message_params)
  	if @message.save
  		flash[:notice] = 'New message created!'
  		redirect_to '/wall', notice: 'Message was successfully created.'
  	else
  		flash[:errors] = @message.errors.full_messages
  		redirect_to '/wall'
  	end
  end
	private
		def message_params
			params.require(:message).permit(:user_id, :content)
		end
end

class SessionsController < ApplicationController
	def new
	end

	def create
		user = User.find_by(name: params[:session][:name])
		if user
			flash[:success] = "Logged in"
			log_in user
			redirect_to user
		else
			flash[:danger]	= "User not found"
			render 'new' 	
		end
	end

	def destroy
		log_out
		redirect_to root_path
	end
end
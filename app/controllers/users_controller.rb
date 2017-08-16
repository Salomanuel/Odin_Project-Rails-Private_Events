class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def create
		@user = User.create(user_params)
		log_in @user
		redirect_to @user
	end

	def show
		@user = User.find(params[:id])
		# TABLE
		@resource 	 					= @user.created_events
		@second_column_title  = "date"
		@proc = Proc.new { |arg| arg.date }
		@prev_events 			= @user.attended_events.prev_events
		@upcoming_events 	= @user.attended_events.upcoming_events
	end

	def index
		@users 	 = User.all
		@second_column_title  = "created events"
	end

	private
		def user_params
			params.require(:user).permit(:name)
		end
end
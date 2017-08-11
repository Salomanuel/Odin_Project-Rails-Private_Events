class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def create
		@user = User.create(user_params)
		redirect_to @user
	end

	def show
		@user = User.find(params[:id])
	end

	def index
		@resource 	 = User.all
		@second_column_title  = "created events"
		@proc = Proc.new { |arg| arg.created_events.count }
	end

	private
		def user_params
			params.require(:user).permit(:name)
		end
end
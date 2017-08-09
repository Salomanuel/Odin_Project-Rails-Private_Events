module SessionsHelper

	def log_in(user)
		session[:user_name] = user.name
	end

	def current_user
		@current_user ||= User.find_by(name: session[:user_name])
	end

	def logged_in?
		!current_user.nil?
	end

	def log_out
		session[:user_name] = nil
		@current_user 			= nil
	end

end
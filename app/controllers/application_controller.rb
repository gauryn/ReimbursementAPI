class ApplicationController < ActionController::API
	# Prevent CSRF attacks by raising an exception.
	# For APIs, you may want to use :null_session instead.
	# protect_from_forgery with: :exception

	private
	def current_user
		@current_user ||= User.find(session[:user_id]) if session[:user_id]
		# render json: @current_user
	end
	helper_method :current_user

	def logged_in?
		current_user 
	end
	helper_method :logged_in?

	def check_login
		if !logged_in?
			render json: "Please log in", status: 400
		end
	end

end

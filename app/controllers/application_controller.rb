class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
	
# 	rescue_from Rack::Timeout::RequestTimeoutError, :with => :handle_timeout
	
  protected
  def handle_timeout(exception)
    ActiveRecord::Base.connection.reset!
		render html: '<script>'
	end
end

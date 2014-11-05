class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :authenticate_with_basic

  def authenticate_with_basic
    authenticate_or_request_with_http_basic do |username, password|
      authenticator = Authenticate.new(username, password)
      session[:instructor] = authenticator.instructor?
      authenticator.valid?
    end
  end
end

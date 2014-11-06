class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception # turn this on if we start doing real web stuff

  before_filter :authenticate_with_basic

  attr_reader :authenticator

  def authenticate_with_basic
    authenticate_or_request_with_http_basic do |username, password|
      @authenticator = Authenticate.new(username, password)
      session[:instructor] = authenticator.instructor?
      authenticator.valid?
    end
  end
end

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # before_filter :authenticate_user_from_token!, unless: :devise_controller?
  before_action :authenticate_user!, unless: :devise_controller?
end

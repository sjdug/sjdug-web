class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user
  helper_method :user_signed_in?
  helper_method :active_nav?

  def current_user
    begin
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    rescue
      nil
    end
  end

  def user_signed_in?
    !!current_user
  end

  def active_nav?(key)
    key == controller_name
  end

  def sjdug_organizer
    @sjdug_organizer ||= Eventbrite::Organizer.new(ENV['SJDUG_ORG_ID'])
  end
end

#coding: utf-8
class ApplicationController < ActionController::Base
  protect_from_forgery

  # setup locale for the application
  before_filter :setup_locale

  private

    def setup_locale
      I18n.locale = params[:locale] || I18n.default_locale
    end

    def current_user
      #@current_user ||= User.find(session[:user_id]) if session[:user_id]
      @current_user ||= User.find_by_auth_token(cookies[:auth_token]) if cookies[:auth_token]
    end
    helper_method :current_user

    def local_network?
      # TODO: check a certain range of ip address
      # require 'ipaddr'
      #     ip_i = IPAddr.new(request.remote_ip).to_i
      #     return ip_i == IPAddr.new('127.0.0.1').to_i
      true
    end
    helper_method :local_network?

    def authentication_success(user)
      if params[:remember_me]
        cookies.permanent[:auth_token] = user.auth_token
      else
        cookies[:auth_token] = user.auth_token
      end
    end
    helper_method :authentication_success
end

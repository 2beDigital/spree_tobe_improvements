class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :accept_cookies

  include Spree::BaseHelper

  protected
  
  def accept_cookies
    if !request.cookies['accept.cookies'].present?
      set_accept_cookies
      return false
    else 
      return true
    end       
  end

  def set_accept_cookies
    response.set_cookie 'accept.cookies', {
                                            value: 'true',
                                            path: '/',
                                            expires: 1.year.from_now.utc
                                        }
  end
end

class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper
  
  #def require_ssl
  #  redirect_to :protocol => "https://"
  #end
  
end

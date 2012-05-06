class IdentitiesController < ApplicationController
  layout "login"

  def new
    session["return_to"] = request.referer unless session[:return_to].present?
    @identity = env['omniauth.identity']
  end
end

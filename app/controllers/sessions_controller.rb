class SessionsController < ApplicationController
  def create
    if user = User.from_omniauth(env['omniauth.auth'])
      session[:id] = user.id
    end
    redirect_to user_path(user.id)
  end
end

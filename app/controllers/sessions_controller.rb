class SessionsController < ApplicationController
  def create
   user = User.from_omniauth(env["omniauth.auth"])
   session[:user_id] = user.id
   if user.token_id.nil?
     redirect_to edit_user_path(user)
   else
    redirect_to user_path(user) 
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end

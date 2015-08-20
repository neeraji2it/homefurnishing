class OmniauthCallbacksController < ApplicationController
 

 def facebook
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    p "FDSGDGGDGFDGFDGFDGFD"
    p user
    p "DFGDGFDGDGFDGGFDGFDGFG"
    sign_in(user)
    redirect_to root_url
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end

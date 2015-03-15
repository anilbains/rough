class SessionsController < ApplicationController

  skip_before_action :require_user

  def create
    user = User.find_by(email: params["email"])
    if user && user.authenticate(params["password"])
      session["user_id"] = user.id
      redirect_to root_path, notice: "You are signed in!"
    else
      redirect_to root_path, alert: "Sorry try again!"
    end
  end


  def destroy
    session["user_id"] = nil
    redirect_to root_path, notice: "See ya later!"
  end


end 

class UsersController < ApplicationController

  def index
    @users= User.all
  end

  def show
    @user= User.find_by(id: params[:id])
    
  end 

  def new
    @user=User.new

  end

  def create
    user_params = params.require( :user).permit( :firstname, :lastname, :dateofbirth, :location_id, :company)
    User.create(user_params)
    redirect_to users_path
  end

  def edit
    @user= User.find_by(id: params[:id])
  end

  def update
    user_params = params.require( :user).permit( :firstname, :lastname, :dateofbirth, :location_id, :company)
    @user= User.find_by(id: params[:id])
    @user.update(user_params)
    redirect_to users_path
  end

  def destroy
    @user= User.find_by(id: params[:id])
    @user.delete
    redirect_to users_path
  end


end

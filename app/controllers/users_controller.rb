class UsersController < ApplicationController
  skip_before_action :require_user, only: [:new, :create, :index]
  
  def index
    @users= User.all
  end

  def show
    @user= User.find_by(id: params[:id])
    @members=@user.members
    
  end 

  def new
    @user=User.new

  end

  def create
    user_params = params.require( :user).permit( :firstname, :lastname, :dateofbirth, :location_id, :company, :email, :password)
    @user=User.create(user_params)
    file_uploaded = params["user"]["userphoto"]
    
    if @user.valid? && file_uploaded!=nil
      file_data = file_uploaded.read

      new_file = Rails.root.join("public", "images", "userphotos", "#{@user.id}.jpg")
    
      File.open(new_file, "wb") do |f|
        f.write(file_data)
      end

      redirect_to users_path, notice: "Great you are a registered user now"
    
  
    else
      redirect_to new_user_path, alert: "Please fill the firstname, lastname and upload a photo"
    end

  end



  def edit
    @user= User.find_by(id: params[:id])
  end

  def update
    user_params = params.require( :user).permit( :firstname, :lastname, :dateofbirth, :location_id, :company)
    @user= User.find_by(id: params[:id])
    @user.update(user_params)
    File.delete(Rails.root.join("public", "images", "userphotos", "#{@user.id}.jpg"))

    file_uploaded = params["user"]["userphoto"]
    
    if @user.valid? && file_uploaded!=nil
      file_data = file_uploaded.read

      new_file = Rails.root.join("public", "images", "userphotos", "#{@user.id}.jpg")
    
        File.open(new_file, "wb") do |f|
          f.write(file_data)
        end

    end

      redirect_to users_path, notice: "User Info Updated!"
  end

  def destroy
    @user= User.find_by(id: params[:id])
    @user.delete
    redirect_to users_path
  end


end

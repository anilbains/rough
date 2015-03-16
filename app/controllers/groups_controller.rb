class GroupsController < ApplicationController
  skip_before_action :require_user, only: [:index]

  def index
    @groups= Group.all
  end
  
  def show    
    @group= Group.find_by(id: params[:id])
    @members=@group.members
      
  end 

  def new
    @group=Group.new
  end

  def create
    group_params = params.require( :group).permit( :name, :year)
    @group=Group.create(group_params)
    
    # read the uploaded file
    file_uploaded = params["group"]["groupphoto"]

    if @group.valid? && file_uploaded!=nil
      file_data = file_uploaded.read

      # write the uploaded file to a new file somewhere
      new_file = Rails.root.join("public", "images", "groupphotos", "#{@group.id}.jpg")

      File.open(new_file, "wb") do |f|
        f.write(file_data)
      end 

      redirect_to groups_path
    end 

  end

  def edit
    @group=Group.find_by(id: params[:id])
  
  end


  def update
    group_params = params.require( :group).permit( :name, :year)
    @group=Group.find_by(id: params[:id])
    @group.update(group_params)
    File.delete(Rails.root.join("public", "images", "groupphotos", "#{@group.id}.jpg"))

    # read the uploaded file
    file = params["group"]["groupphoto"]
    
    file_data = file.read

    # write the uploaded file to a new file somewhere
    the_file = Rails.root.join("public", "images", "groupphotos", "#{@group.id}.jpg")

    File.open(the_file, "wb") do |f|
      f.write(file_data)
    end 

    redirect_to groups_path
  end

  def destroy
    
    @group=Group.find_by(id: params[:id])

    @group.delete
    redirect_to groups_path
  end
   
 
end

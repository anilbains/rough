class GroupsController < ApplicationController


  def index
    @groups= Group.all
  end

  def show    

    @group= Group.find_by(id: params[:id])
    
  end 

  def new
    @group=Group.new
  end

  def create
    group_params = params.require( :group).permit( :name, :year)
    Group.create(group_params)
    redirect_to groups_path
  end

  def edit
    @group=Group.find_by(id: params[:id])
  
  end


  def update
    group_params = params.require( :group).permit( :name, :year)
    @group=Group.find_by(id: params[:id])
    @group.update(group_params)
    redirect_to group_path
  end

  def destroy
    
    @group=Group.find_by(id: params[:id])

    @group.delete
    redirect_to groups_path
  end
   
 
end

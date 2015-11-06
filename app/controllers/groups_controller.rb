class GroupsController < ApplicationController

  def index
    @groups = Group.all
  end

  def show
    @group = Group.find(params[:id])
    @attendances = @group.attendances.all
    #@attending = @group.attendances.where(:user_id == current_user.id)
    if @group.attendances.where(:user_id == current_user.id) == current_user
      @attending = current_user.id
    else
      @current_user_is_attending = false;
      @attending = current_user.id
    end
  end

  def new
    @group = Group.new
  end

  def edit
    @group = Group.find(params[:id])

  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to groups_path
    else
      render :new
    end
  end

  def update
    @group = Group.find(params[:id])
    if @group.update_attributes(group_params)
      redirect_to groups_path
    else
      render 'edit'
    end
  end

  def destroy
    @group = Group.find(params[:id])
    if @group.destroy
      redirect_to root_path
    end
  end

  def join_group
    @user = current_user
    @group = Group.find(params[:id])
    @attendance = @user.attendances.build(:group_id => @group.id)
    @attendance.save
     flash.now[:notice] = "You have successfully joined."
    redirect_to group_path(@group)
  end

  def leave_group
    @user = current_user
    @group = Group.find(params[:id])
    @attendance = @group.attendances.where(:user_id == @user.id)
    @attendance.destroy
  end

  private
    def set_group
      @group = Group.find(params[:id])
    end

    def group_params
      params.require(:group).permit(:topic, :date, :location)
    end
end

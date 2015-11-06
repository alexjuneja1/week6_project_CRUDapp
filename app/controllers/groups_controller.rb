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
    @group = Group.find(params[:id])
    unless Attendance.where(:group_id => @group.id, :user_id => @user.id).first
      Attendance.create(:user_id => @user.id, :group_id => @group.id)
      flash[:notice] = "You have successfully joined."
      redirect_to group_path(@group)
    else
      flash[:notice] = "You have already previously joined."
      redirect_to group_path(@group)
    end
  end

  def leave_group
    @group = Group.find(params[:id])
    @attendance = @group.attendances.where(:user_id == @user.id).first
    @attendance.destroy
    flash[:notice] = "You have successfully left."
    redirect_to group_path(@group)
  end

  private
    def set_group
      @group = Group.find(params[:id])
    end

    def group_params
      params.require(:group).permit(:topic, :date, :location)
    end
end

class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    # localhost:3000/users/8 -> params[:id] = 8
    @user = User.find(params[:id])

  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to '/'
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      redirect_to '/'
    else
      redirect_to 'show'
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :name, :email, :password, :cellphone)
  end
end

class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    # localhost:3000/users/8 -> params[:id] = 8
    @current_user = User.find(params[:id])

  end

  def new
    @current_user = User.new
  end

  def create
    @current_user = User.new(user_params)
    if @current_user.save
      session[:user_id] = @current_user.id
      redirect_to user_path(@current_user)
    else
      render :new
    end
  end

  def edit
    @current_user = User.find(params[:id])
  end

  def update
    @current_user = User.find(params[:id])
    if @current_user.update(user_params)
      redirect_to '/'
    else
      render 'edit'
    end
  end

  def destroy
    @current_user = User.find(params[:id])
    if @current_user.destroy
      session[:user_id] = nil
      redirect_to '/'
    else
      redirect_to 'show'
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :name, :email, :password, :cellphone, :password_confirmation)
  end
end

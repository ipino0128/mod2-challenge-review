class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:message] = "User created succesfully"
      redirect_to user_path(@user) 
    else 
      # byebug
      flash.now[:message] = @user.errors.full_messages[0]
      render :new
    end 
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:message] = "User created succesfully"
      redirect_to user_path(@user) 
    else 
      flash.now[:message] = @user.errors.full_messages[0]
      render :edit
    end 
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end

  private 
  def user_params 
    params.require(:user).permit(:name, :age)
  end 

end

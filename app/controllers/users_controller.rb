class UsersController < ApplicationController
	before_action :set_user, only: [:show, :edit, :update, :destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      flash[:success]="Successfully created"
      redirect_to users_path
    else
      flash[:error] = "Unsuccessful"
      render :new
    end
  end

  def index
    @users = User.all
  end

  def show
  	
  end

  def edit

  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to user_path
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit( :first_name,
                                  :last_name,
                                  :dob,
                                  :city,
                                  :address,
                                  :gender)
  end
end

class UsersController < ApplicationController
    before_action :set_user, only: [:edit, :update]
  
    def new
      @user = User.new
    end
  
    def create
      @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id
        redirect_to home_path, notice: 'User was successfully created.'
      else
        render :new
      end
    end
  
    def edit
    end
  
    def update
      if @user.update(user_params)
        redirect_to home_path, notice: 'User was successfully updated.'
      else
        render :edit
      end
    end
  
    private
  
    def set_user
      @user = current_user
    end
  
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :role, :band_id, :active, :password, :password_confirmation)
    end
  end
  
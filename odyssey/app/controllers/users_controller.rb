class UsersController < ApplicationController
    #before_action :entry, only: [:edit]
    #before_action :standard, only: [:edit]
    #before_action :admin
    before_action :logged_in
    before_action :is_admin
    def index 
        @user = User.all
    end
    
    def show 
        @user = User.find(params[:id])
    end   
    
    def edit
        @user = User.find(params[:id])
        redirect_to action: "update"
    end
    
    def new
        @user = User.new
    end
    
    def destroy
        User.find(params[:id]).destroy
        redirect_to users_url
    end
    
    def update
        @user = User.find(params[:id])
        if @user.update_attributes(user_params)
          flash[:success] = "Profile updated"
          redirect_to users_url
        else
          redirect_to action: "edit"
        end    
    end
    
    def create
        @user = User.new(user_params)
        if @user.save
          redirect_to action: "index"
        else
          render 'new'
        end
    end
    
    private
    
    def user_params
      params.require(:user).permit(:user_name, :user_email, :permission_level, :password, :password_confirmation)
    end
end

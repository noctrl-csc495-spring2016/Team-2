class UsersController < ApplicationController
    #before_action :entry, only: [:edit]
    #before_action :standard, only: [:edit]
    #before_action :admin
    
    def index 
        @user = User.all.order("UPPER(user_name)")
    end
    
    def show 
        @user = User.find(params[:id])
    end   
    

    
    def new
        @user = User.new
    end
    
    def destroy
        User.find(params[:id]).destroy
        redirect_to users_url, notice: "Succesfully deleted account"
    end
    
    def update
        @user = User.find(params[:id])
        if @user.update_attributes(user_params)
            flash[:success] = "Successfully updated account"
          redirect_to users_url
        else
          flash[:danger] = "Password is invalid"
          redirect_to action: "show"
        end    
    end
    
    def create
        @user = User.new(user_params)
        if @user.save
          flash[:success] = "Successfully updated account"
          redirect_to action: "index"
        else
          flash.now[:bad_input] = "Input Invalid"
          render 'new'
        end
    end
    
    private
    
    def user_params
      params.require(:user).permit(:user_name, :user_email, :permission_level, :password, :password_confirmation)
    end
end

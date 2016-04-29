class UsersController < ApplicationController
    #before_action :entry, only: [:edit]
    #before_action :standard, only: [:edit]
    #before_action :admin
    
    def index 
        @user = User.all
    end
    
    def show
        @user = User.find(params[:id])
    end
    
    def new
        @user = User.new
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
      params.require(:user).permit(:user_name, :user_email, :permission_level)
    end
end

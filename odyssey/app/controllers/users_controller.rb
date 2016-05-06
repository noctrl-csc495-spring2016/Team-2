class UsersController < ApplicationController
    before_action :logged_in
    before_action :is_admin, except: [:show,:update, :edit]

    def index 
        @user = User.all.order("UPPER(user_name)")
    end
    
    def edit
        @user = current_user
    end
    
    def show 
        @user = User.find(params[:id])
    end   
    
    def new
        @user = User.new
    end
    
    def destroy
        User.find(params[:id]).destroy
        flash[:success] = "Successfully deleted account"
        redirect_to users_url
    end
    
    def update
        @user = User.find(params[:id])
        if(@user.permission_level == 2)
            if @user.update_attributes(admin_params)
                flash[:success] = "Successfully updated account"
              redirect_to users_url
            else
              flash[:danger] = "Password is invalid"
              redirect_to action: "show"
            end    
        else
            if @user.update_attributes(user_params)
                flash[:success] = "Successfully updated account"
              redirect_to users_url
            else
              flash[:danger] = "Password is invalid"
              redirect_to action: "show"
            end   
        end
            
    end
    
    def create
        @user = User.new(admin_params)
        if @user.save
          flash[:success] = "Successfully updated account"
          redirect_to action: "index"
        else
          flash.now[:bad_input] = "Input Invalid"
          render 'new'
        end
    end
    
    private
    
    def admin_params
      params.require(:user).permit(:user_name, :user_email, :permission_level, :password, :password_confirmation)
    end
    
    def user_params
        params.require(:user).permit(:user_name, :user_email, :password, :password_confirmation)
    end
        
end
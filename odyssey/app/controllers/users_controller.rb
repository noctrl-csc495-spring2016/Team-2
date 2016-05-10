class UsersController < ApplicationController
    before_action :logged_in
    before_action :is_admin, except: [:update, :edit]

    def index 
        @user = User.all.order("UPPER(user_name)")
    end
    
    def edit #nonadmins edit page
        @user = User.find(params[:id])
    end
    
    def show #admins edit page
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
        if(current_user.permission_level == 2) #admin is attempting to update user
            if @user.update_attributes(admin_params)
                flash[:success] = "Successfully updated account"
              redirect_to action: "index"
            else
              flash[:danger] = "Password is invalid"
              redirect_to action: "show"
            end    
        else #nonadmin wants to change password
            if @user.update_attributes(user_params)
                flash[:success] = "Successfully updated account"
              redirect_to pickups_path
            else
              flash[:danger] = "Password is invalid"
              redirect_to action: "edit"
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
    
    #admin_params is able to change permission_level, a right reserved for admin only
    def admin_params
      params.require(:user).permit(:user_id, :user_email, :permission_level, :password, :password_confirmation)
    end
    
    #nonadmins can change password only
    def user_params
        params.require(:user).permit(:password, :password_confirmation)
    end
        
end
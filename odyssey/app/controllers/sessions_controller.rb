class SessionsController < ApplicationController
  def new
  end
  def create
    # Find the user by their user ID
    user = User.find_by(user_id: params[:session][:user_id])
    # TODO: Will need to actually authenticate the user, once the Users
    #  controller is finished.
    #if user && user.authenticate(params[:session][:password])
    
    # If the user exists, send them to the home1 page
    if user
      redirect_to '/home/home1'
    else
      # Otherwise, keep them on the login page.
      flash.now[:danger] = 'Invalid user ID/password combination'
      render 'new'
    end
  end
end

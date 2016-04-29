class SessionsController < ApplicationController
  def new
  end
  def create
    #render 'pages/home/home1'
    redirect_to '/home/home1'
  end
end

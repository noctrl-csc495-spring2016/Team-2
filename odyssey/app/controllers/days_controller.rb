class DaysController < ApplicationController
  
  #SCHEMA
  # t.date     "date"
  # t.integer  "number_of_pickups"
  # t.datetime "created_at",        null: false
  # t.datetime "updated_at",        null: false
  # t.string   "status"
  
  # Use show action to show a day and all of its coresponding scheduled pickups
  def show
    @day = Pickup.find(params[:id])
  end
  
  # Define a new pickup day
  def new
    @day = Pickup.new
  end
  
  # Fill our day record with stuff
  def create
    # Set a status and created and updated at here
    @day = Pickup.new(pickup_params)
    if @day.save
      redirect_to @day
    else
      render 'new'
    end
  end
  
  # Edit :number_of_pickups, :updated_at, :status
  def edit
    @day = Pickup.find(params[:id])
  end
  
  # Update :number_of_pickups, :updated_at, :status
  def update
    # Set the updated at and maybe the status
    @day = Pickup.find(params[:id])
    if @day.update_attributes(pickup_params)
      redirect_to @day
    else
      render 'edit'
    end
  end
  
  private
    # Make sure we only accept params we want
    def pickup_params
      params.require(:day).permit(:date)   # Need to put something in parens
    end
end

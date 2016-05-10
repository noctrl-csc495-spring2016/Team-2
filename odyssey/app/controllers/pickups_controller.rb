#Kyle Loveless
#Pickup Controller handles requests to the pickup pages

class PickupsController < ApplicationController
  before_action :logged_in
  before_action :admin_or_standard, except: [:show,:index,:new,:create]
  
  #The index is the bullpen
  def index
    @pickup = Pickup.all
  end
  
  #new will allow the user to fill out a form to create a new pickup
  def new
    @pickup = Pickup.new
  end
  
  #this action is what allows the user to actually create the pickup and passes 
  #the params into a new pickup, then redirects back to the bullpen
  def create
    @pickup = Pickup.new(pickup_params)
    if @pickup.save
      redirect_to '/pickups'
    else
      flash[:danger] = "Input Invalid"
      render 'new'
    end
  end
  
  #allows the scheduler to edit a particular pickup and schedule it to a day
  def edit
    @pickup = Pickup.find(params[:id])
    @days = Day.where("date >= ?", Date.today).all
  end
  
  #updates the pickup that the scheduler is working with and overwrites the 
  #saved information
  def update
    @pickup = Pickup.find(params[:id])
    if @pickup.update_attributes(pickup_params)
      redirect_to "/pickups"
    else
      render 'edit'
    end
  end
  
  private
    
    def pickup_params
      params.require(:pickup).permit(:donor_name, :donor_address_line1, :donor_address_line2, :donor_city, :donor_zip, :donor_dwelling_type, :donor_location_instructions,
      :donor_phone, :donor_email, :number_of_items, :item_description, :other_notes, :pickup_time, :day_id)
    end

end

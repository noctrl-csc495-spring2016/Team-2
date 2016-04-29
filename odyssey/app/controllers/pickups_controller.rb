class PickupsController < ApplicationController
  
  def show
    @pickup = Pickup.find(params[:id])
  end
  
  def new
    @pickup = Pickup.new
  end
  
  def create
    @pickup = Pickup.new(pickup_params)
    if @pickup.save
      redirect_to @pickup
    else
      render 'new'
    end
  end
  
  def edit
    @pickup = Pickup.find(params[:id])
  end
  
  def update
    @pickup = Pickup.find(params[:id])
    if @pickup.update_attributes(pickup_params)
      redirect_to @pickup
    else
      render 'edit'
    end
  end
  
  private
    
    def pickup_params
      params.require(:pickup).permit(:donor_name, :donor_city)
    end

end

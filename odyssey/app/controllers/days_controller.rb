class DaysController < ApplicationController
  
  #SCHEMA
  # t.date     "date"
  # t.integer  "number_of_pickups"
  # t.datetime "created_at",        null: false
  # t.datetime "updated_at",        null: false
  # t.string   "status"
  
  # Use show action to show a day and all of its coresponding scheduled pickups
  def show
    @day = Day.find(params[:id])
  end
  
  # /schedule/schedule2
  def schedule2
    render 'pages/schedule/schedule2.html'
  end
  
  def all
     @days = Day.all
     respond_to do |format|
      format.json { render json: @days }
    end
  end
  
  # Fill our day record with stuff
  def create
    
    if Day.find_by_date(params[:date])
      respond_to do |format|
        format.json { render json: "Sorry, that day is already marked as a pickup day."}
      end
    else
      @day = Day.new(day_params)
      @day.number_of_pickups = 0
      @day.status = "active"
      @day.created_at = Time.zone.now
      @day.updated_at = Time.zone.now
      respond_to do |format|
        if @day.save
          format.json { render json: @day}
        else
          format.json { render json: @day.errors}
        end
      end
    end
  end
  
  # Update :number_of_pickups, :updated_at, :status
  def update
    # Set the updated at and maybe the status
    @day = Day.find(params[:id])
    if @day.update_attributes(day_params)
      redirect_to @day
    else
      render 'edit'
    end
  end
  
  private
    # Make sure we only accept params we want
    def day_params
      params.permit(:date, :number_of_pickups, :status)  
    end
end

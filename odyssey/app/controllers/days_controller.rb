class DaysController < ApplicationController
  before_action :logged_in
  before_action :admin_or_standard
  #SCHEMA
  # t.date     "date"
  # t.integer  "number_of_pickups"
  # t.datetime "created_at",        null: false
  # t.datetime "updated_at",        null: false
  # t.string   "status"
  # t.integer  "month"
  # t.integer  "day"
  # t.integer  "year"
  
  # Use this action to show all the days on schedule1 screen.
  # render 'days/schedule1.html.erb'
  def index
    @days = Day.where("date >= ?", Date.today).order('date ASC').all
  end
  
  # Use show action to show a day and all of its coresponding scheduled pickups
  # render 'days/schedule3.html.erb'
  def show
    @day = Day.find(params[:id])
    @pickups = @day.pickups
  end
  
  # Show the screen to show a new day. This screen has calendar and a form.
  # render 'days/schedule2.html.erb'
  def new
    @day = Day.new
    
    # All the month options for our form
    @month_options = [['January', 'January'],['February', 'February'],['March', 'March'],['April', 'April'],
          ['May', 'May'],['June', 'June'],['July', 'July'],['August', 'August'],['September', 'September'],
          ['October', 'October'],['November', 'November'],['December', 'December']]
    
    # All the day options for our form. Always just provide 31 
    #   days because the js will handle filtering which one to show 
    #   based on the month that is selected.
    @day_options = []
    (31).times do |d|
      @day_options[d] = [(d + 1).to_s, (d + 1)]
    end
    
    # All the year options for our form. By default we start with the
    #   current year. Also are starting by showing up to 5 years in advance.
    #   Change the number in (#).times in parens to change the number of years
    #   to show.
    @year_options = []
    (5).times do |y|
      @year_options[y] = [(Time.new.year + y).to_s, (Time.new.year + y)]
    end
  end
  
  # Use this action to return all of the days when called from ajax. Used by 
  #   the calendar only.
  def all
     @days = Day.where("date >= ?", Date.today).all
     respond_to do |format|
      format.json { render json: @days }
    end
  end
  
  # Use this action to create a new day from an ajax call made by the calendar.
  #   The calendar will pass a date only and then we will give the number of
  #   pickups 0, created at and updated at to right now, and set the record to
  #   active.
  def create
    @day = Day.new(day_params)
    @day.month = Date::MONTHNAMES.index(params[:month])
    @day.date = ("#{params[:month]} #{params[:day]} #{params[:year]}").to_date
    
    if !Day.where("month = ? AND day = ? AND year = ?", @day.month, @day.day, @day.year).empty?
      flash[:danger] = "That day is already configured as a pickup day"
      redirect_to '/days/new'
    elsif @day.date < Date.today
      flash[:danger] = "The day you entered is in the past! Please enter a day that is in the future."
      redirect_to '/days/new'
    else
      @day.number_of_pickups = 0
      @day.status = "active"
      @day.created_at = Time.zone.now
      @day.updated_at = Time.zone.now

      if @day.save
        flash[:success] = "The day was succesfully added"
        redirect_to '/days' # @day
      else
        flash[:danger] = "Day could not be added"
        redirect_to '/days/new'
      end
    end
  end
  
  # To be implemented. Use to unschedule a pickup day
  def delete
    # peace and quiet
  end
  
  private
    # Make sure we only accept params we want
    def day_params
      params.permit(:month, :day, :year, :date)  
    end
end

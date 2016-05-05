class ReportsController < ApplicationController  
  before_action :logged_in
  before_action :admin_or_standard

  def donor
      respond_to do |format|
        format.html
        format.csv { 
          donors = Pickup.joins(:day).where("cast(strftime('%m', date) as int) = ?",
          params[:date][:month]).where("cast(strftime('%Y', date) as int) = ?",
          params[:date][:year])
          send_data donors.to_donor_csv, filename: params[:filename]
        }
      end
  end

  def truck
    respond_to do |format|
      format.html{
        @days = Day.all
      }
      format.csv {
        pickups = Pickup.joins(:day).where("date = ?", params[:pickupday])
        send_data pickups.to_routes_csv, filename: "routes.csv"
      }
    end
  end
end
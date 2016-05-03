class ReportsController < ApplicationController  
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
    @days = Day.all
  end
end
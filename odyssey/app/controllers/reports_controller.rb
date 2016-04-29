class ReportsController < ApplicationController
  def reports
  end
  
  def donor
  respond_to do |format|
    format.html
    format.csv { 
      @donors = Pickup.where(donor_name: 'Anthony Rizzo')
      send_data @donors.to_csv, filename: "Test.csv"}
    end
  end

  def truck
  end
end

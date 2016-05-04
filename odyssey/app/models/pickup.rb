class Pickup < ActiveRecord::Base
  belongs_to :day
  
  def self.to_donor_csv
    headers = ["FIRST", "SPOUSE", "LAST", "ADDRESS", "TOWN", 
    "STATE", "ZIP", "E-MAIL","DATE DONATED", "ITEMS DONATED"]
    attributes = %w{donor_name donor_name donor_name address
    donor_city state donor_zip donor_email date item_description}
    CSV.generate(headers: true) do |csv|
      csv << headers
      all.each do |donor|
        csv << attributes.map{ |attr| donor.send(attr) }
      end
    end
  end
  
  def self.to_routes_csv
    headers = ["Street","City","State","Zip","Country","Notes"]
    attributes = %w{address donor_city state donor_zip country donor_location_instructions}
    CSV.generate(headers: true) do |csv|
      csv << headers
      all.each do |pickup|
        csv << attributes.map{ |attr| pickup.send(attr) }
      end
    end
  end

  private
  
  def date
   Day.find(day_id).date
  end
  
  def state
    "IL"
  end
  
  def country
    "US"
  end
  
  def address
    "#{donor_address_line1} #{donor_address_line2}"
  end
end

class Pickup < ActiveRecord::Base
  belongs_to :follower, class_name: "Day"
  
  def self.to_csv
    headers = ["FIRST", "SPOUSE", "LAST", "ADDRESS", "TOWN", 
    "STATE", "ZIP", "E-MAIL","DATE DONATED", "ITEMS DONATED"]
    attributes = %w{donor_name donor_name donor_name donor_address_line1
    donor_city state donor_zip donor_email date item_description}
    CSV.generate(headers: true) do |csv|
      csv << headers
      all.each do |donor|
        csv << attributes.map{ |attr| donor.send(attr) }
      end
    end
  end
  
  def state
    "Illinois"
  end
  
  def date
    "12/12/12"
  end
end

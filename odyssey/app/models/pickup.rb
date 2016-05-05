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
  
  def self.to_pdf(day)
    pickupdate = Date.parse(day)
    pdf = Prawn::Document.new
    pdf.image "#{Rails.root}/app/assets/images/SC_logo.png", :width => 200, :position => :right
    pdf.move_down 10
    pdf.text  pickupdate.strftime("Pickup Schedule for %A %b %d, %Y") , 
                    :align => :center, :style => :bold, :size => 14
    pdf.move_down 10
    data = [["", "<b>Name/Contact</b>", "<b>Address</b>", "<b>Donor Items/Notes</b>"]]
    i = 1;
    all.each do |pickup|
      data += [[i,"#{pickup.donor_name}\n#{pickup.donor_phone}",
                  "#{pickup.donor_address_line1}\n#{pickup.donor_address_line2}\n#{pickup.donor_city}, IL #{pickup.donor_zip}",
                  "#{pickup.item_description}\nDonor: '#{pickup.donor_location_instructions}'"]]
      i += 1
    end
    
    pdf.table(data, :header => true, :cell_style => { :size => 10, :inline_format => true},
                    :position => :center, :column_widths => [15,130,135,240])
    pdf.render
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
    "#{donor_address_line1}, #{donor_address_line2}"
  end
end

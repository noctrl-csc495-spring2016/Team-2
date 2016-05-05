class Day < ActiveRecord::Base
  has_many :pickups, class_name: "Pickup"

  validates :date, presence: true
  validates :number_of_pickups, presence: true
  validates :created_at, presence: true
  validates :updated_at, presence: true
  validates :status, presence: true
  validates :month, presence: true
  validates :day, presence: true
  validates :year, presence: true
  
end

# Global variables
status = "active"


# Create some ENTRY users
3.times do |n|
  name  = Faker::Name.name
  email = "entry-user-#{n+1}@csc495.org"
  password = "foobar"
  password_confirmation = "foobar"
  User.create!(user_id:               "entry-user#{n+1}",
              user_name:              name,
              user_email:             email,
              user_password_digest:   password,
              password:               password,
              password_confirmation:  password_confirmation,
              permission_level:       0,
              created_at:             Time.zone.now,
              updated_at:             Time.zone.now,
              status:                 status)
end

# Create some STANDARD users
3.times do |n|
  name  = Faker::Name.name
  email = "standard-user-#{n+1}@csc495.org"
  password = "foobar"
    password_confirmation = "foobar"
  User.create!(user_id:               "std-user#{n+1}",
              user_name:              name,
              user_email:             email,
              password:               password,
              password_confirmation:  password_confirmation,
              permission_level:       1,
              created_at:             Time.zone.now,
              updated_at:             Time.zone.now,
              status:                 status)
end

# Create some ADMIN users
2.times do |n|
  name  = Faker::Name.name
  email = "admin-user-#{n+1}@csc495.org"
  password = "foobar"
    password_confirmation = "foobar"
  User.create!(user_id:               "admin-user#{n+1}",
              user_name:              name,
              user_email:             email,
              password:               password,
              password_confirmation:  password_confirmation,
              permission_level:       2,
              created_at:             Time.zone.now,
              updated_at:             Time.zone.now,
              status:                 status)
end

# Create a day
  Day.create!(date:                   Date.today,
              number_of_pickups:      2,
              created_at:             Time.zone.now,
              updated_at:             Time.zone.now,
              status:                 status,
              month:                  Time.new.month,
              day:                    Time.new.day,
              year:                   Time.new.year)

# Create a blank admin user, so that by default, while developing, login will still work
User.create!(user_id: "",
              user_name: "Test Admin",
              user_email: "foo@foo.com",
              password:               "password",
              password_confirmation:  "password",
              permission_level: 2,
              created_at: Time.zone.now,
              updated_at: Time.zone.now,
              status: status)
              
Pickup.create!(
            day_id:                       1,
            donor_name:                   "Anthony Rizzo",
            donor_address_line1:          "1060 W Addison St",
            donor_address_line2:          "Suite 101",
            donor_city:                   "Chicago",
            donor_zip:                    "60613",
            donor_dwelling_type:          "Historic Ball Park",
            donor_location_instructions:  "Ride the Red Line",
            donor_phone:                  "(773) 404-2827",
            donor_email:                  "rizzo@cubs.com",
            number_of_items:               1,
            item_description:              "Autographed baseball",
            created_at:                   Time.zone.now,
            updated_at:                   Time.zone.now
)

Pickup.create!(
            day_id:                       1,
            donor_name:                   "Mark Christianson",
            donor_address_line1:          "1233 Chanticleer Ave",
            donor_address_line2:          "Apartment D",
            donor_city:                   "Bolingbrook",
            donor_zip:                    "55555",
            donor_dwelling_type:          "Mini-House",
            donor_location_instructions:  "Beware of the Chihuahua",
            donor_phone:                  "(555) 555-5555",
            donor_email:                  "mark.christianson@mheducation.com",
            number_of_items:               5,
            item_description:              "table/4 chairs, china cabinet (matching set)",
            created_at:                   Time.zone.now,
            updated_at:                   Time.zone.now
)
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
  Day.create!(date:                   Date.today.to_s,
              number_of_pickups:      3,
              created_at:             Time.zone.now,
              updated_at:             Time.zone.now,
              status:                 status)

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
require_relative( "../models/customer.rb" )
require_relative( "../models/session.rb" )
require_relative( "../models/booking.rb" )

require("pry-byebug")

Customer.delete_all()
Session.delete_all()
Booking.delete_all()

customer1 = Customer.new({
  "name" => "Joe Rodger",
  "membership_type" => "Premium",
  "membership_status" => true
  })
customer1.create_member()

customer2 = Customer.new({
  "name" => "Mark Stewart",
  "membership_type" => "Basic",
  "membership_status" => true
  })
customer2.create_member()

customer3 = Customer.new({
  "name" => "Andy Carson",
  "membership_type" => "Basic",
  "membership_status" => false
  })
customer3.create_member()

customer4 = Customer.new({
  "name" => "John McHugh",
  "membership_type" => "Premium",
  "membership_status" => false
  })
customer4.create_member()


session1 = Session.new({
  "name" => "Body Pump",
  "starting_time" => "11:00:00",
  "type" => "strength",
  "status" => true,
  "max_capacity" => 5,
  })
session1.create_session()

session2 = Session.new({
  "name" => "Spin",
  "starting_time" => "14:00:00",
  "type" => "cardio",
  "status" => true,
  "max_capacity" => 3,
  })
session2.create_session()

session3 = Session.new({
  "name" => "Yoga",
  "starting_time" => "18:00:00",
  "type" => "mindfulness",
  "status" => true,
  "max_capacity" => 6,
  })
session3.create_session()


booking1 = Booking.new({
  "customer_id" => customer1.id,
  "session_id" => session1.id
  })

booking1.save()

booking2 = Booking.new({
  "customer_id" => customer2.id,
  "session_id" => session1.id
  })

booking2.save()

booking3 = Booking.new({
  "customer_id" => customer3.id,
  "session_id" => session2.id
  })

booking3.save()


binding.pry
nil

require_relative( "../models/customer.rb" )

require("pry-byebug")

Customer.delete_all()

customer1 = Customer.new({
  "name" => "Joe Rodger",
  "membership_type" => "Premium",
  "membership_status" => "true"
  })

customer1.create_member()


customer2 = Customer.new({
  "name" => "Mark Stewart",
  "membership_type" => "Basic",
  "membership_status" => "true"
  })

customer2.create_member()


customer3 = Customer.new({
  "name" => "Andy Carson",
  "membership_type" => "Basic",
  "membership_status" => "false"
  })

customer3.create_member()


customer4 = Customer.new({
  "name" => "John McHugh",
  "membership_type" => "Premium",
  "membership_status" => "false"
  })

customer4.create_member()


binding.pry
nil

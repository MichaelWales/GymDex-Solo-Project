require('sinatra')
require('sinatra/contrib/all') if development?
require_relative('../models/booking')
also_reload( '../models/*' )

get '/booking/all' do
  @bookings = Booking.all_bookings()
  erb(:"bookings/book_success")
end

get '/booking/new' do
  @customers = Customer.all_active_members()
  @sessions = Session.all_active_sessions()
  erb(:"bookings/new")
end

post '/booking/all' do
  booking = Booking.membership_check(params)
  booking.save()
  redirect to('/customer/all')
end

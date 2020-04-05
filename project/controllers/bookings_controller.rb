require('sinatra')
require('sinatra/contrib/all') if development?
require_relative('../models/booking')
also_reload( '../models/*' )

get '/booking/all' do
  @bookings = Booking.all_bookings()
  erb(:"bookings/index")
end

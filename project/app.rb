require('sinatra')
require('sinatra/contrib/all')
require_relative('controllers/bookings_controller')
require_relative('controllers/customers_controller')
require_relative('controllers/sessions_controller')

get '/' do
  erb(:index)
end

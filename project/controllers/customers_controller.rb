require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/customer')
also_reload( '../models/*' )


get '/customer/all' do
  @customers = Customer.all_members()
  erb(:"customers/index")
end

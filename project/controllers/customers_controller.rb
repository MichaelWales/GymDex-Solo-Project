require('sinatra')
require('sinatra/contrib/all')
require_relative('views/customers/new')
require_relative('views/customers/show')
also_reload( '../models/*' )


get '/customer/all' do
  @customers = Customer.all_members()
  erb(:"customers/index")
end

get '/customer/new' do
  erb(:new)
end

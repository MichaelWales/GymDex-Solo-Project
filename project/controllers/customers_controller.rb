require('sinatra')
require('sinatra/contrib/all') if development?
require_relative('../models/customer')
also_reload( '../models/*' )

get '/customer/all' do
  @customers = Customer.all_members()
  erb(:"customers/index")
end

get '/customer/new' do
  erb(:"customers/new")
end

post '/customer/all' do
  customer = Customer.new(params)
  customer.create_member()
  redirect to('/customer/all')
end

get 'customer/:id/edit' do
  erb(:"customers/edit")
end

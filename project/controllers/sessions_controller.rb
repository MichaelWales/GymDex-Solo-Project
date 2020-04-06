require('sinatra')
require('sinatra/contrib/all') if development?
require_relative('../models/session')
also_reload( '../models/*' )

get '/session/all' do
  @sessions = Session.all_sessions()
  erb(:"sessions/index")
end

get '/session/new' do
  erb(:"sessions/new")
end

post '/session/all' do
  session = Session.new(params)
  session.create_session()
  redirect to('/session/all')
end

get '/session/:id/edit' do
  id = params['id'].to_i
  @session = Session.find(id)
  erb(:"sessions/edit")
end

post '/session/:id' do
  session = Session.new(params)
  session.update()
  redirect to('session/all')
end

get '/session/:id/bookings' do
  id = params['id'].to_i
  session = Session.find(id)
  @Customers = session.customers()
  erb(:"sessions/bookings")
end

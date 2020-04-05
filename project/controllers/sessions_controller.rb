require('sinatra')
require('sinatra/contrib/all') if development?
require_relative('../models/session')
also_reload( '../models/*' )

get '/sessions/all' do
  @sessions = Session.all_sessions()
  erb(:"sessions/index")
end

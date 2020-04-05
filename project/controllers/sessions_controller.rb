require('sinatra')
require('sinatra/contrib/all') if development?
require_relative('../models/session')
also_reload( '../models/*' )

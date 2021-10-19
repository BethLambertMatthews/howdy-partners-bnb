require 'sinatra/base'
require 'sinatra/reloader'
require './lib/database/database_connection_setup'
require './lib/model/user'

class HowdyPartnersBnB < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    'Howdy Partners :)'
  end

  get '/sign-up' do
    erb :sign_up
  end

  post '/sign-up' do
    User.create_user(params[:name], params[:email], params[:password])
    redirect('/')
  end

  run! if app_file == $0
end

require 'sinatra/base'
require 'sinatra/reloader'
require './lib/database/database_connection_setup'
require './lib/model/property'
require './lib/model/user'

class HowdyPartnersBnB < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end
  
  enable :sessions
  

  get '/' do
    puts session[:current_user]
    "Howdy Partners :) current user id:#{session[:current_user]}"
  end

  get '/sign-up' do
    erb :sign_up
  end

  post '/sign-up' do
    new_user_id = User.create_user(params[:name], params[:email], params[:password])
    session[:current_user] = new_user_id
    redirect('/')
  end

  get '/add-new-property' do
    erb :add_new_property
  end

  post '/add-new-property' do
    Property.add_property(params[:name], params[:description], params[:price])
    redirect('/')
  end

  run! if app_file == $0
end

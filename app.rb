require 'sinatra/base'
require 'sinatra/reloader'
require 'sinatra/flash'
require './lib/database/database_connection_setup'
require './lib/model/property'
require './lib/model/user'

class HowdyPartnersBnB < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end
  
  enable :sessions
  register Sinatra::Flash

  get '/' do
    @all_properties = Property.all_properties
    @current_user = session[:current_user]
    erb :index
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

  get '/login' do
    erb :login
  end

  post '/login' do
    result = User.log_in(params[:email], params[:password])
    if result == "This user does not exist"
      flash[:notice] = "Sorry, we didn't recognise those details. Please try again."
      redirect('/login')
    else
      session[:current_user] = result
      redirect('/')
    end
  end

  run! if app_file == $0
end

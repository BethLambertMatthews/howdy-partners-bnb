require 'sinatra/base'
require 'sinatra/reloader'
require './lib/database/database_connection_setup'
require './lib/property'

class HowdyPartnersBnB < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    'Howdy Partners :)'
  end

  get '/add-new-property' do
    erb(:add_new_property)
  end

  post '/new-property' do
    Property.add_property(params[:name], params[:description], params[:price])
    redirect('/')
  end

  run! if app_file == $0
end

require 'sinatra/base'
require 'sinatra/reloader'

class HowdyPartnersBnB < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    'Howdy Partners :)'
  end

  run! if app_file == $0
end
require 'sinatra/base'

class CAPONE < Sinatra::Base

  get '/' do
    erb :index
  end

  post '/registration' do
    redirect '/confirmation'
  end

  get '/confirmation' do
    erb :confirmation
  end

  run! if app_file == $0
end

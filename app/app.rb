require 'sinatra/base'

class CAPONE < Sinatra::Base

  get '/' do
    erb :index
  end

  post '/registration' do
    p sal = params[:Salutation]
    p fir = params[:First_Name]
    p las = params[:Last_Name]
    p cou = params[:Previous_Country]
    p gen = params[:Gender]
    redirect '/confirmation'
  end

  get '/confirmation' do
    erb :confirmation
  end

  run! if app_file == $0
end

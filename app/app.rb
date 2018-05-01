require 'sinatra/base'
require_relative 'models/citizen.rb'
require_relative 'models/database.rb'

class CAPONE < Sinatra::Base

  get '/' do
    erb :index
  end

  post '/registration' do
    json = Citizen.to_json(params[:Salutation], params[:First_Name],
      params[:Last_Name], params[:Previous_Country], params[:Gender])
    Citizen.store_citizen_details(json)

    redirect '/confirmation'
  end

  get '/confirmation' do
    erb :confirmation
  end

  run! if app_file == $0
end

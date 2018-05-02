require 'sinatra'
require 'sinatra/base'
require "sinatra/namespace"
require_relative 'models/citizen.rb'
require_relative 'models/database.rb'

class CAPONE < Sinatra::Base
  register Sinatra::Namespace
  enable :sessions

  get '/' do
    erb :index
  end

  post '/registration' do

    citizen_id = params[:Last_Name] + Citizen.random_id_generator
    session[:citizen_id] = citizen_id

    json = Citizen.convert_to_hash(params[:Salutation], params[:First_Name],
      params[:Last_Name], params[:Previous_Country], params[:Gender], citizen_id)

    Citizen.store_citizen_details(json)

    redirect '/confirmation'
  end

  get '/confirmation' do
    @citizen_id = session[:citizen_id]
    erb :confirmation
  end

  namespace '/api/v1' do
    before do
      content_type 'application/json'
    end

    get '/citizens' do
      Citizen.get_citizens_in_json
    end
  end

  run! if app_file == $0
end

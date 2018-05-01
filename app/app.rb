require 'sinatra/base'

class CAPONE < Sinatra::Base


  #
  get '/' do
    erb :index
  end
  #
  # post '/' do
  #
  # end
  #
  # get '/' do
  #
  # end

  run! if app_file == $0
end

require 'sinatra/base'

class CAPONE < Sinatra::Base

  run! if app_file == $0
  #
  get '/' do
    "Welcome to CapitalOne"
  end
  #
  # post '/' do
  #
  # end
  #
  # get '/' do
  #
  # end

end

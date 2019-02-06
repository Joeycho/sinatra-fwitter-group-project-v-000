require './config/environment'
require "./app/models/user"

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "password_security"
  end
  
  get '/' do
    erb :index
  end
  
  get '/signup' do
    if session[:user_id]==nil
    erb :signup
    else
    redirect "/tweets"
    end
  end
  
  post '/signup' do
      if params[:username]!="" && params[:email]!="" && params[:password]!=""
        user = User.new(:username => params[:username],:email => params[:email], :password => params[:password])
        user.save
        session[:user_id] = user.id
        redirect "/tweets"
      else
        redirect "/signup"
      end
  end
  
  get '/tweets' do
    erb :"/tweets/index"
  end
  
  get '/login' do
    if session[:user_id]==nil
    erb "/login"
    else
    redirect "/tweets"
    end
  end
  
  post '/login' do
    user = User.find_by(:username => params[:username])
 
  if user && user.authenticate(params[:password])
    session[:user_id] = user.id
    redirect "/tweets"
  else
    redirect "/login"
  end
  end
  
  get "/logout" do
    session.clear
    redirect "/login"
  end


end

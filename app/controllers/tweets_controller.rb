class TweetsController < ApplicationController

get '/tweets' do
    if session[:user_id]==nil
    redirect "/login"
    else
    erb :"/tweets/index"
    end
end


end

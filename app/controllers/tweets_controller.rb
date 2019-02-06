class TweetsController < ApplicationController
  
  get '/tweets' do
      if session[:user_id]==nil
        redirect "/login"
      else
        erb :"/tweets/index"
      end
  end
  
  get '/tweets/new' do
    if session[:user_id]==nil
        redirect "/login"
      else
        erb :"/tweets/new"
      end
  end
  
  post '/tweets' do
        if params[:content]!=""
        Tweet.create(:content => params[:content], :user_id => session[:user_id])
          redirect "/tweets"
        else
          redirect "/tweets/new"
        end
  end

  get "/tweets/:id" do
    if session[:user_id]==nil
        redirect "/login"
    else
      @tweet = Tweet.find(params[:id])
      erb :"/tweets/show"
    end
  end
  
  patch '/tweets/:id' do  
    @tweet = Tweet.find_by_id(params[:id])
    @tweet.content = params[:content]
    @tweet.save
    redirect to "/tweets/#{@tweet.id}"
  end
  
  delete '/tweets/:id' do 
    @tweet = Tweet.find_by_id(params[:id])
    @tweet.delete
    redirect to '/tweets'
  end

end

class UsersController < ApplicationController

  get "/users/#{user.slug}" do
    erb :show
  end

end

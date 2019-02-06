class UsersController < ApplicationController

  get "/users/#{user.slug}" do
    erb "users/index"
  end

end

class UsersController < ApplicationController

  get "/users/:slug" do
    @user = User.find_by_slug
    erb "users/index"
  end

end

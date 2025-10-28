
class UsersController < ApplicationController
  def index
    @users = User.order(created_at: :desc).limit(100)
  end
end

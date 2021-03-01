module V1
  class UsersController < ApplicationController
    def index
      users = User.all
      users.any? ? (render json: users) : (response_not_found)
    end

  end
end

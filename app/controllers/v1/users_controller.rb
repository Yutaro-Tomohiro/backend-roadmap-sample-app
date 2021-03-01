module V1
  class UsersController < ApplicationController
    def index
      users = User.all
      users.any? ? (render json: users) : (response_not_found)
    end

    def create
      user = User.new(user_params)
      if user.name.blank?
        response_bad_request
      elsif User.exists?(name: user.name)
        response_conflict
      elsif user.save
        response_created
      end
    end

    private
      def user_params
        params.permit(:name)
      end

  end
end

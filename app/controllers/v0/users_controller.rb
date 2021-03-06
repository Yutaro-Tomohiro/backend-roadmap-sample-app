module V0
  class UsersController < ApplicationController

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

    def show
      user = User.find_by_id(params[:id])

      if !number?(params[:id])
        response_bad_request
      elsif user.nil?
        response_not_found
      else
        render json: user
      end
    end

    def update
      user = User.find_by_id(params[:id])

      if !number?(params[:id])
        response_bad_request
      elsif user.nil?
        response_not_found
      elsif params[:name].blank?
        response_bad_request
      elsif User.exists?(name: params[:name])
        response_conflict
      elsif user.update(user_params)
        response_no_content
      end
    end

    private
      def user_params
        params.permit(:name)
      end
  end
end

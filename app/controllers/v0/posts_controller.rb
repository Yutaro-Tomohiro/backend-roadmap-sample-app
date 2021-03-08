module V0
  class PostsController < ApplicationController
    def index
      post = Post.where(user_id: params[:user_id])

      if !number?(params[:user_id])
        response_bad_request
      elsif post.empty?
        response_not_found
      else
        render json: post
      end
    end
  end
end

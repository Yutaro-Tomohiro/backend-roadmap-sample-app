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

    def create
      user = User.find_by_id(params[:user_id])
      post = user&.post&.new(post_params)

      if !number?(params[:user_id]) || user.nil? ||post.title.blank? || post.article.blank?
        response_bad_request
      elsif post.save
        response_created
      end
    end

    private
      def post_params
        params.permit(:title, :article)
      end
  end
end

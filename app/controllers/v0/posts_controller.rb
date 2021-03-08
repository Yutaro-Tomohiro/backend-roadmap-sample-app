module V0
  class PostsController < ApplicationController
    def index
      posts = Post.where(user_id: params[:user_id])

      if !number?(params[:user_id])
        response_bad_request
      elsif posts.empty?
        response_not_found
      else
        render json: posts
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

    def show
      user = User.find_by_id(params[:user_id])
      post  = user&.post&.find_by_id(params[:id])

      if !number?(params[:user_id]) || user.nil?
        response_bad_request
      elsif post.nil?
        response_not_found
      else
        render json: post
      end
    end

    def update
      user = User.find_by_id(params[:user_id])
      post = user&.post&.find_by_id(params[:id])

      if !number?(params[:user_id]) || user.nil? ||params[:title].blank? || params[:article].blank?
        response_bad_request
      elsif post.nil?
        response_not_found
      elsif post.update(post_params)
        response_no_content
      end
    end

    def destroy
      user = User.find_by_id(params[:user_id])
      post = user&.post&.find_by_id(params[:id])

      if !number?(params[:user_id]) || user.nil?
        response_bad_request
      elsif post.nil?
        response_not_found
      elsif post.destroy
        response_no_content
      end
    end

    private
      def post_params
        params.permit(:title, :article)
      end
  end
end

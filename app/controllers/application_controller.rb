class ApplicationController < ActionController::API
  def response_not_found
    render status: 404
  end
end

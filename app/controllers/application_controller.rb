class ApplicationController < ActionController::API

  def response_created
    render status: 201
  end

  def response_bad_request
    render status: 400
  end

  def response_not_found
    render status: 404
  end

  def response_conflict
    render status: 409
  end
end

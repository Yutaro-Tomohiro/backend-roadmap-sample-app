class ApplicationController < ActionController::API

  def response_created
    render status: 201
  end

  def response_no_content
    render status: 204
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

  # 文字列が数字だけで構成されているかチェックする関数
  def number?(str)
    nil != (str =~ /\A[0-9]+\z/)
  end
end

class ApplicationController < ActionController::API
  include ActionController::HttpAuthentication::Token::ControllerMethods
  before_action :snakeize_params
  before_action :init
  before_action :require_login

  rescue_from StandardError do |e|
    Errors.log(e)
    render json: { code: e.message.camelize(:lower) }, status: Errors.get_status(e)
  end

  @session = {
    library_id: nil,
    role: nil,
    user_id: nil,
  }

  def init
    tokens = {}
    authenticate_with_http_token do |token, options|
      tokens.store(token, options)
    end
    @tokens = tokens
    @headers = request.headers
    if (tokens)
      _, session = Session.get(@tokens, @headers)
      @session = session if session
    end
  end

  protected
    def snakeize_params
      params.deep_snakeize!
    end

    def require_login
      raise UnauthorizedError, 'invalid_token' if !@session
    end
end

class NotFoundError < StandardError
  def initialize(msg = 'not_found')
    super
  end
end
class UnauthorizedError < StandardError
  def initialize(msg = 'unauthorized')
    super
  end
end

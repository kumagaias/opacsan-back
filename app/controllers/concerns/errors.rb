module Errors
  def self.get_status(e)
    case (e.class.to_s)
    # 400
    when
      "ActiveRecord::RecordNotFound",
      "NoMethodError",
      "BadRequestError",
      "ActionController::ParameterMissing"
      :bad_request 
    # 401
    when
      "UnauthorizedError",
      "Pundit::NotAuthorizedError"
      :unauthorized
    # 404
    when
      "NotFoundError"
      :not_found
    # 422
    when
      "ActiveRecord::RecordInvalid",
      "UnprocessableEntityError"
      :unprocessable_entity
    # 500
    when
      "Redis::CannotConnectError"
      :internal_server_error
    # 500
    else
      :internal_server_error
    end
  end

  def self.get_message(e)
    case (e.class.to_s)
    when
      'UnauthorizedError'
      'unauthorized'
    else
      e.message.underscore
    end
  end

  def self.log(e)
    # show trace log at testing with "$ rails t v (verbose)".
    if !Rails.env.test? || ARGV[0] == 'v'
      p e
      Rails.backtrace_cleaner.clean(e.backtrace).each do |message|
        p message.indent(2)
      end
    end
  end
end

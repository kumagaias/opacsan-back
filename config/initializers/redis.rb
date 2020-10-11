if Rails.env.production?
  REDIS = Redis.new(
    host: Rails.application.credentials.dig(:redis, :host),
    password: Rails.application.credentials.dig(:redis, :password),
    port: Rails.application.credentials.dig(:redis, :port),
  )
else
  REDIS = MockRedis.new
end

require 'jwt'

module Authentication
  ALGORITHM = 'HS256'

  def issue(payload)
    JWT.encode(
        payload,
        auth_secret,
        ALGORITHM
    )
  end

  def decode(token)
    JWT.decode( token,
                auth_secret,
                true,
                { algorithm: ALGORITHM }).first
  end

  def auth_secret
    ENV['AUTH_SECRET']
  end
end

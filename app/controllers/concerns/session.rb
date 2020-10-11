module Session
  def self.get(tokens, headers)
    tokens.each do |token, options|
      session = REDIS.hgetall(token)
      if session['user_id'] == headers['User-Id'] && session['library_id'] == headers['Library-Id']
        # reset expire time
        REDIS.expire(token, Settings.session.expire)
        session['user_id'] = session['user_id'].to_i
        session['library_id'] = session['library_id'].to_i
        return token, session.symbolize_keys
      end
    end
  end

  def self.get_all
    REDIS.keys
  end

  def self.create(id, role, library_id)
    self.destroy(id)
    token = Utils.get_token
    REDIS.mapped_hmset(
      token,
      'user_id' => id,
      'role' => role,
      'library_id' => library_id
    )
    REDIS.expire(token, Settings.session.expire)
    return token
  end

  def self.destroy(token)
    REDIS.del(token) 
  end
end

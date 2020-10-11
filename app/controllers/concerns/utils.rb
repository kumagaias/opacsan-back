module Utils
  def self.camelize(res)
    res.transform_keys{|k| k.to_s.camelize(:lower)}
  end

  def self.get_now()
    Time.current
  end

  def self.get_name_from_email(email)
    email.split('@').first.downcase
  end

  def self.get_activation_code
    # SecureRandom.random_number(10**6).to_s.rjust(6, '0')
    SecureRandom.hex(32)
  end

  def self.get_activation_expired_at(current = Time.current)
    current + Settings.activation.expire
  end

  def self.get_token
    SecureRandom.hex(64)
  end

  def self.get_expired_at_sql(is_expired)
    return "<=" if (is_expired)
    ">="
  end
end

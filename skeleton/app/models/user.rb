class User < ApplicationRecord
  
  def reset_session_token!
    self.session_token = SecureRandom.urlsafe_base64(16)
    self.save!
    self.session_token
  end
  
  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end
  
  def is_password?(password)
    BCrypt::Password.new(password).is_password?(self.paspassword_digest)
  end
  
  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)
    
    return user if user && user.is_password?(password)
    nil
  end
  
end

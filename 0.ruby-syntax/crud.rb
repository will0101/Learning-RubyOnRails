module Crud
  require "bcrypt"
  p "Crud module"

  def create_hash(password)
    BCrypt::Password.create(password)
  end

  def verify_hashed_password(password,hash)
    BCrypt::Password.new(hash) == password
  end
  
end
# app/commands/authenticate_user.rb

class AuthenticateUser
  prepend SimpleCommand

  def initialize(email, password)
    @email = email
    @password = password
  end

  def call
    JsonWebToken.encode(user_id: user.id) if user
  end

  private

  attr_accessor :email, :password

  def user
    user = User.authenticate(email, password)
    return user if user

    errors.add :user_authentication, 'invalid credentials'
    nil
  end
end
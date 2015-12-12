class User < ActiveRecord::Base
  include BCrypt

  has_many :surveys, foreign_key: "maker_id"
  has_many :taken_surveys, foreign_key: "taker_id"

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

end

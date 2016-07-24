class User < ActiveRecord::Base
  has_secure_password
  has_many :events, dependent: :destroy
end

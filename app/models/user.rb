class User < ActiveRecord::Base
  has_many :groups
  has_many :attendances
  has_secure_password
  validates :email, presence: true, uniqueness: true
end

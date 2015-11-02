class Group < ActiveRecord::Base
  belongs_to :users
  has_many :attenances 
end

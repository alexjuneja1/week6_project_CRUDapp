class Group < ActiveRecord::Base
  belongs_to :users
  has_many :attendances 
end

class Group < ActiveRecord::Base
  belongs_to :users
  has_many :attendances

  def date_published
    created_at.localtime.strftime("%A, %B, %-d, %Y at %l:%M %p")
  end
end

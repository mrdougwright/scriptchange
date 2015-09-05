class Rating < ActiveRecord::Base
  belongs_to :script
  belongs_to :user
  validates_presence_of :script, :user

  Stars = [1,2,3,4,5]
end
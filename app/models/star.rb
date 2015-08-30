class Star < ActiveRecord::Base
  belongs_to :script
  belongs_to :user

  validates_presence_of :user_id, :script_id
end
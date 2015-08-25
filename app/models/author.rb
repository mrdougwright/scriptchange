class Author < ActiveRecord::Base
  belongs_to :user
  belongs_to :script
end
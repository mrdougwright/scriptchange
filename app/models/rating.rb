class Rating < ActiveRecord::Base
  belongs_to :script
  belongs_to :user
  validates_presence_of :script, :user
  validate :not_new_user

  Stars = [1,2,3,4,5]

  def not_new_user
    if User.find(self.user_id).created_at > 24.hours.ago
      errors.add(:base, "Sorry, you're account is too new to rate scripts!")
    end
  end
end
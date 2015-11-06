class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :name, :email
  has_many :scripts, through: :authors
  has_many :authors
  has_many :ratings
  has_many :stars

  def starred_script?(script_id)
    Star.where(user_id: self.id, script_id: script_id).any?
  end

end

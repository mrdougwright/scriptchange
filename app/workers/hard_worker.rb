class HardWorker
  include Sidekiq::Worker
  def perform(user_id, name)
    # testing sidekiq
    User.find(user_id).update_attribute(:name, name)
  end
end

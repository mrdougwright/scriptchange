module CalculateRatings
  def self.ave_rating(script_id)
    ratings = Rating.where(script_id: script_id)
    return 0 if ratings.count < 1
    (ratings.sum(:stars).to_f / ratings.count).round(2)
  end
end
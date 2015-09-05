class RatingsController < ApplicationController
  before_action :authenticate_user!

  def create
    @rating = Rating.create(ratings_params)
    if @rating.save
      flash[:notice] = 'Rating Saved!'
      redirect_to :back
    else
      render :new
    end
  end

private

  def ratings_params
    params.require(:rating).permit(:script_id, :user_id, :stars)
  end
end

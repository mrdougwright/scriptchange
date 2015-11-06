class RatingsController < ApplicationController
  before_action :authenticate_user!

  def create
    @rating = Rating.create(ratings_params)
    if @rating.save
      flash[:notice] = 'Rating Saved!'
      redirect_to :back
    else
      flash[:alert] = @rating.errors.full_messages.join(' ')
      redirect_to :root
    end
  end

  def update
    @rating = Rating.find(params[:id])
    @rating.update!(ratings_params)
    redirect_to @rating.script, notice: 'Rating updated'
  end

private

  def ratings_params
    params.require(:rating).permit(:script_id, :user_id, :stars)
  end
end

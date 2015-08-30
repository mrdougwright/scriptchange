class StarsController < ApplicationController

  def create
    script = Script.find params[:script_id]
    @star = Star.create(user_id: params[:user_id], script_id: script.id)
    redirect_to :back
  end

end
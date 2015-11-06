class CountviewsController < ApplicationController
  include ApplicationHelper
  before_action :authenticate_user!

  def update
    @script = Script.find_by_slug(params[:script_slug])
    @script.count_view unless current_user.scripts.include?(@script)
    respond_to do |format|
      format.json { render :nothing => true }
      format.html { render :nothing => true }
    end
  end

end

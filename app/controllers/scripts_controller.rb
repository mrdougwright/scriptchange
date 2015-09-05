class ScriptsController < ApplicationController
  include ApplicationHelper

  before_action :authenticate_user!
  before_action :retrieve_script, only: [:show, :edit, :update, :destroy]
  before_action only: [:edit, :update, :destroy] do
    authenticate_script_author(params[:id])
  end


  def index
    @myscripts = Script.where(id: current_user.authors.pluck(:script_id))
    @my_starred_scripts = Script.where(id: current_user.stars.pluck(:script_id)) if current_user
    @scripts = Script.all
  end

  def show
    @rating = Rating.new
    @script.count_view unless current_user.scripts.include? @script
  end

  def create
    @script = CreateScript.with_user(current_user, pdf_params)
    @script.save ? redirect_to(@script) : render(:new)
  end

  def new
    @script = Script.new
  end

  def update
    @script.update!(pdf_params)
    redirect_to @script
  end

  def destroy
    @script.destroy
    flash[:notice] = 'Script removed.'
    redirect_to :root
  end

private

  def pdf_params
    params.require(:script).permit(:pdf, :title, :tagline, :summary, :genre)
  end

  def retrieve_script
    @script = Script.find_by_slug(params[:id])
  end
end

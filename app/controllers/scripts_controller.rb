class ScriptsController < ApplicationController
  include ApplicationHelper

  before_action :authenticate_user!
  before_action :authenticate_script_author!, only: [:edit, :update]

  def index
    @myscripts = Script.where(id: current_user.authors.pluck(:script_id))
    @scripts = Script.all
  end

  def show
    @script = Script.find_by_slug(params[:id])
  end

  def create
    @script = CreateScript.with_user(current_user, pdf_params)
    if @script.save
      redirect_to @script
    else
      render :new
    end
  end

  def new
    @script = Script.new
  end

  def edit
    @script = Script.find_by_slug(params[:id])
  end

  def update
    @script = Script.find_by_slug(params[:id])
    @script.update!(pdf_params)
    redirect_to @script
  end

private

  def pdf_params
    params.require(:script).permit(:pdf, :title, :tagline, :summary, :genre)
  end
end

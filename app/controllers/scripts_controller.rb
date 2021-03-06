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
    @user_rating = Rating.where(user_id: current_user.id, script_id: @script.id).first
  end

  def create
    @script = CreateScript.with_user(current_user, pdf_params)
    if @script.errors.blank?
      s3o = CreateAwsUpload.with_file(params[:script][:file].original_filename, params[:script][:file].tempfile)
      @script.file_url = s3o.public_url
      @script.pdf_file_name = s3o.key
      redirect_to(@script) if @script.save
    else
      redirect_to(:back, alert: pretty_errors(@script) )
    end
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
    params.require(:script).permit(:file, :title, :tagline, :summary, :genre)
  end

  def retrieve_script
    @script = Script.find_by_slug(params[:id])
  end
end

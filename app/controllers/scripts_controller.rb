class ScriptsController < ApplicationController
  # investigate security issues
  protect_from_forgery with: :null_session

  def index
    @scripts = Script.all
  end

  def show
    @script = Script.find(params[:id])
  end

  def create
    @script = Script.new(pdf_params)
    if @script.save
      redirect_to @script
    else
      render :new
    end
  end

  def new
    @script = Script.new
  end

private

  def pdf_params
    params.require(:script).permit(:pdf, :title, :tagline, :summary)
  end
end

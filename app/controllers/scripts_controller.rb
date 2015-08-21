class ScriptsController < ApplicationController
  # investigate security issues
  protect_from_forgery with: :null_session

  def show
    @script = Script.find(params[:id])
    send_data @script.data, filename: @script.filename, type: @script.content_type
  end

  def create
    return if params[:script].blank?
    @script = Script.new
    @script.uploaded_file = params[:script]

    if @script.save
      flash[:notice] = "Your script has been uploaded!"
      redirect_to scripts_path
    else
      flash[:error] = "There was a problem saving your script."
      render :new
    end
  end
end

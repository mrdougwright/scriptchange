class UsersController < ApplicationController
  def create
    @user = User.create(user_params)
  end

  def show
    @user = User.find(params[:id])
  end

private

  def user_params
    params.require(:email).permit(:name)
  end
end
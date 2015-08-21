class UserController < ApplicationController
  def create
    @user = User.create(user_params)
  end

private

  def user_params
    params.require(:email).permit(:name)
  end
end
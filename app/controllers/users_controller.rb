class UsersController < ApplicationController
  def new
  end

  def index
  end

  def create
    user = User.new(user_params).save
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
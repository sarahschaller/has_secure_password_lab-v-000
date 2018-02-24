class UsersController < ApplicationController
  def new
  end

  def index
    @user = current_user
    render template: 'users/homepage'
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to users_index_path
    else
      redirect_to new_user_path
    end
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
